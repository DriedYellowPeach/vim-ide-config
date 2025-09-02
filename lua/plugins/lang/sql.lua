return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.diagnostics.sqlfluff.with({
        extra_args = { "--dialect", "postgres" },
      }),
      nls.builtins.formatting.sql_formatter,
    })
  end,
}
