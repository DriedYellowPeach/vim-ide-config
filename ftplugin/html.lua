vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet-ls" })

-- lsp setup
require("user.lsp.languages.emmet").setup()
