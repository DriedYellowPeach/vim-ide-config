return {
  "saghen/blink.cmp",
  dependencies = {
    "MahanRahmati/blink-nerdfont.nvim",
  },
  opts = {
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
