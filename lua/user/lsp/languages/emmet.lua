local M = {}

function M.setup()
	local lsp_manager = require("lvim.lsp.manager")
	local defaults = require("lvim.lsp").get_common_opts()

	lsp_manager.setup("emmet_ls", {
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"html",
			"css",
			"astro",
		},
		on_attach = defaults.on_attach,
		on_init = defaults.on_init,
		on_exit = defaults.on_exit,
		capabilities = defaults.capabilities,
	})
end

return M
