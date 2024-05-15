vim.filetype.add({ extension = { typ = "typst" } })

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "typst-lsp" })

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("typst_lsp", {
	settings = {
		exportPdf = "onType",
	},
})
