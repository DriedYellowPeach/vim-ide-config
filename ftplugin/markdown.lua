vim.g.markdown_recommended_style = 0
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.spelllang = 'en_us'
vim.opt_local.spell=true
vim.opt_local.wrap = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "markdown" } },
}
