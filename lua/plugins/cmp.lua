return {
  "saghen/blink.cmp",
  dependencies = {
    "MahanRahmati/blink-nerdfont.nvim",
  },
  opts = {
    enabled = function()
      return not vim.list_contains({ "DressingInput" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end,
    keymap = {
      preset = "enter",
      ["<c-j>"] = { "select_next" },
      ["<c-k>"] = { "select_prev" },
    },
    completion = {
      documentation = {
        window = {
          border = "rounded",
        },
      },
      menu = {
        border = "rounded",
      },
      ghost_text = {
        enabled = false,
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        scrollbar = true,
      },
    },
  },
}
