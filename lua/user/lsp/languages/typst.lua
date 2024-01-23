vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "typst-lsp" })
vim.filetype.add({ extension = { typ = "typst" } })
local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("typst_lsp", {
	settings = {
		exportPdf = "onType",
	},
})
