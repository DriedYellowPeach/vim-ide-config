require "user.lsp.languages.rust"
require "user.lsp.languages.go"
require "user.lsp.languages.clang"


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

