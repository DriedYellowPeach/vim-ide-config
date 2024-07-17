vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("emmet_ls", {
	filetypes = { "css" },
	on_attach = require("lvim.lsp").common_on_attach,
	on_init = require("lvim.lsp").common_on_init,
	on_exit = require("lvim.lsp").common_on_exit,
	capabilities = require("lvim.lsp").common_capabilities(),
})
