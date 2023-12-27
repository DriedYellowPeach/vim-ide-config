vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

-- formatter setup
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "prettier", filetypes = { "css", "html" } },
})
