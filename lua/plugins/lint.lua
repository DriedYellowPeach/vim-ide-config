return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", "/Users/neil/.config/nvim/.markdownlint-cli2.yaml" },
        },
      },
    },
  },
}
