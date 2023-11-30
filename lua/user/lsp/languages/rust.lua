vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local codelldb_path = mason_path .. "bin/codelldb"
local liblldb_path = mason_path .. "packages/codelldb/extension/lldb/lib/liblldb"
local this_os = vim.loop.os_uname().sysname

local util = require("lspconfig.util")
local function is_library(fname)
	local user_home = util.path.sanitize(vim.env.HOME)
	local cargo_home = os.getenv("CARGO_HOME") or util.path.join(user_home, ".cargo")
	local registry = util.path.join(cargo_home, "registry", "src")

	local rustup_home = os.getenv("RUSTUP_HOME") or util.path.join(user_home, ".rustup")
	local toolchains = util.path.join(rustup_home, "toolchains")

	for _, item in ipairs({ toolchains, registry }) do
		if fname:sub(1, #item) == item then
			local clients = vim.lsp.get_active_clients({ name = "rust_analyzer" })
			return #clients > 0 and clients[#clients].config.root_dir or nil
		end
	end
end

local function root_dir(fname)
	local reuse_active = is_library(fname)
	if reuse_active then
		-- vim.notify("reuse active rust analyzer", vim.log.levels.INFO)
		return reuse_active
	end
	local cargo_crate_dir = util.root_pattern("Cargo.toml")(fname)
	local cmd = { "cargo", "metadata", "--no-deps", "--format-version", "1" }
	if cargo_crate_dir ~= nil then
		cmd[#cmd + 1] = "--manifest-path"
		cmd[#cmd + 1] = util.path.join(cargo_crate_dir, "Cargo.toml")
	end
	local cargo_metadata = ""
	local cargo_metadata_err = ""
	local cm = vim.fn.jobstart(cmd, {
		on_stdout = function(_, d, _)
			cargo_metadata = table.concat(d, "\n")
		end,
		on_stderr = function(_, d, _)
			cargo_metadata_err = table.concat(d, "\n")
		end,
		stdout_buffered = true,
		stderr_buffered = true,
	})
	if cm > 0 then
		cm = vim.fn.jobwait({ cm })[1]
	else
		cm = -1
	end
	local cargo_workspace_dir = nil
	if cm == 0 then
		cargo_workspace_dir = vim.json.decode(cargo_metadata)["workspace_root"]
		if cargo_workspace_dir ~= nil then
			cargo_workspace_dir = util.path.sanitize(cargo_workspace_dir)
		end
	else
		vim.notify(
			string.format("[lspconfig] cmd (%q) failed:\n%s", table.concat(cmd, " "), cargo_metadata_err),
			vim.log.levels.WARN
		)
	end
	return cargo_workspace_dir
		or cargo_crate_dir
		or util.root_pattern("rust-project.json")(fname)
		or util.find_git_ancestor(fname)
end

-- The path in windows is different
if this_os:find("Windows") then
	codelldb_path = mason_path .. "packages\\codelldb\\extension\\adapter\\codelldb.exe"
	liblldb_path = mason_path .. "packages\\codelldb\\extension\\lldb\\bin\\liblldb.dll"
else
	-- The liblldb extension is .so for linux and .dylib for macOS
	liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

pcall(function()
	require("rust-tools").setup({
		tools = {
			executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
			reload_workspace_from_cargo_toml = true,
			runnables = {
				use_telescope = true,
			},
			inlay_hints = {
				auto = true,
				only_current_line = false,
				show_parameter_hints = true,
				parameter_hints_prefix = "<-",
				other_hints_prefix = "=>",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
			},
			hover_actions = {
				border = "rounded",
			},
			on_initialized = function()
				vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
					pattern = { "*.rs" },
					callback = function()
						local _, _ = pcall(vim.lsp.codelens.refresh)
					end,
				})
			end,
		},
		dap = {
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
		},
		server = {
			on_attach = function(client, bufnr)
				require("lvim.lsp").common_on_attach(client, bufnr)
				local rt = require("rust-tools")
				vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
			end,

			capabilities = require("lvim.lsp").common_capabilities(),
			root_dir = root_dir,
			settings = {
				["rust-analyzer"] = {
					lens = {
						enable = true,
					},
					checkOnSave = {
						enable = true,
						command = "clippy",
					},
					-- inlayHints = { locationLinks = false },
				},
			},
		},
	})
end)

lvim.builtin.dap.on_config_done = function(dap)
	dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
	dap.configurations.rust = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
end

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })
