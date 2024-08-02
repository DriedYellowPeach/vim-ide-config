-- rust-tools setup
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

-- Figure out codelldb path
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local codelldb_path = mason_path .. "bin/codelldb"
local liblldb_path = mason_path .. "packages/codelldb/extension/lldb/lib/liblldb"
local this_os = vim.loop.os_uname().sysname

-- The path in windows is different
if this_os:find("Windows") then
	codelldb_path = mason_path .. "packages\\codelldb\\extension\\adapter\\codelldb.exe"
	liblldb_path = mason_path .. "packages\\codelldb\\extension\\lldb\\bin\\liblldb.dll"
else
	-- The liblldb extension is .so for linux and .dylib for macOS
	liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

-- set up rustaceanvim
local cfg = require("rustaceanvim.config")
local executors = require("rustaceanvim.executors")

vim.g.rustaceanvim = {
	-- plugin configuration
	tools = {
		-- executor = executors.termopen,
		reload_workspace_from_cargo_toml = true,
		float_win_config = {
			border = "rounded",
		},
		-- disable it because there is a change in neovim 0.10, refersh codelens will try to refresh all buffers
		-- on_initialized = function()
		-- 	vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
		-- 		pattern = { "*.rs" },
		-- 		callback = function()
		-- 			local _, _ = pcall(vim.lsp.codelens.refresh)
		-- 		end,
		-- 	})
		-- end,
		-- 		},
	},

	server = {
		on_attach = function(client, bufnr)
			require("lvim.lsp").common_on_attach(client, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			-- require("lsp-inlayhints").on_attach(client, bufnr)
		end,
		default_settings = {
			-- rust-analyzer lanaguage server configuration
			["rust-analyzer"] = {
				lens = {
					enable = true,
					run = {
						enable = true,
					},
					debug = {
						enable = true,
					},
				},
				checkOnSave = {
					enable = true,
					command = "clippy",
				},
			},
		},
	},
	-- dap = {
	-- 	adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
	-- },
}

-- builtin dap setup
local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

if dap.adapters.rust == nil then
	dap.adapters.rust = {
		type = "server",
		port = "${port}",
		host = "127.0.0.1",
		executable = {
			command = codelldb_path,
			args = { "--liblldb", liblldb_path, "--port", "${port}" },
		},
	}
end

dap.configurations.rust = {
	{
		name = "Native Rust Debug",
		type = "rust",
		request = "launch",
		-- cwd = args.workspaceRoot,
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = function()
			local inputstr = vim.fn.input("Params: ", "")
			local params = {}
			local sep = "%s"
			for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
				table.insert(params, str)
			end
			return params
		end,
		stopOnEntry = false,
		runInTerminal = false,
	},
}
