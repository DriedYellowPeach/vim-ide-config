require("user.lsp.languages.rust")
require("user.lsp.languages.python")
require("user.lsp.languages.java")
require("user.lsp.languages.clang")
-- require("user.lsp.languages.go")
-- require("user.lsp.languages.yaml")

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua", filetypes = { "lua" } },
})
