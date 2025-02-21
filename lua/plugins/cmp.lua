return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" },
    }
    opts.completion.documentation.window = {
      border = "rounded",
    }
    opts.completion.menu = {
      border = "rounded",
    }
    opts.signature = {
      enabled = true,
      window = {
        border = "rounded",
        scrollbar = true,
      },
    }
    opts.completion.ghost_text = {
      enabled = false,
    }
  end,
}
