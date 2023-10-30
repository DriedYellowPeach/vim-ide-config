vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua", filetypes = { "lua" } },
})
