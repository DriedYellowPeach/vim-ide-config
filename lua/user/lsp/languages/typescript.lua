local M = {
	is_init = false,
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_filetypes, { "javascript", "typescript" })

function M.setup()
	if M.is_init then
		return
	end

	local defaults = require("lvim.lsp").get_common_opts()
	local lsp_manager = require("lvim.lsp.manager")
	-- setup tsserver
	lsp_manager.setup("tsserver", {
		enabled = false,
	})

	-- setup vtsls
	lsp_manager.setup("vtsls", {
		default_config = require("vtsls").lspconfig,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		on_attach = function(client, bufnr)
			defaults.on_attach(client, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end,
		on_init = defaults.on_init,
		on_exit = defaults.on_exit,
		capabilities = defaults.capabilities,
		settings = {
			complete_function_calls = true,
			vtsls = {
				enableMoveToFileCodeAction = true,
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
			},
			javascript = {
				inlayHints = {
					parameterTypes = { enabled = true },
					variableTypes = { enabled = true },
					enumMemberValues = { enabled = true },
					functionLikeReturnTypes = {
						enabled = true,
						suppressWhenArgumentMatchesName = false,
					},
					parameterNames = { enabled = "all" },
					propertyDeclarationTypes = { enabled = true },
				},
			},
			typescript = {
				updateImportsOnFileMove = { enabled = "always" },
				suggest = {
					completeFunctionCalls = true,
				},
				inlayHints = {
					parameterTypes = { enabled = true },
					variableTypes = { enabled = true },
					enumMemberValues = { enabled = true },
					functionLikeReturnTypes = {
						enabled = true,
						suppressWhenArgumentMatchesName = false,
					},
					parameterNames = { enabled = "all" },
					propertyDeclarationTypes = { enabled = true },
				},
			},
		},
	})

	local status_ok, dap = pcall(require, "dap")

	if not status_ok then
		return
	end

	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "9229",
		executable = {
			command = "node",
			args = {
				vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"9229",
			},
			-- command = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
			-- args = { "9229" },
		},
	}

	-- require("dap-vscode-js").setup({
	-- 	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- 	-- debugger_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/") .. "packages/js-debug-adapter",
	-- 	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- 	debugger_cmd = { vim.fn.glob(vim.fn.stdpath("data") .. "/mason/") .. "bin/js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	-- 	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	-- 	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- 	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- 	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
	-- })

	for _, language in ipairs({
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
	}) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}
	end

	M.is_init = true
end

return M
