vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet-ls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("emmet_ls", {
  filetypes = { "astro", "html" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "html", "css" } },
}
