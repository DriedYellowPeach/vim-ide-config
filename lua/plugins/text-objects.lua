return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  commit = "e139eb1",
  opts = function(_, opts)
    local ai = require("mini.ai")
    opts.custom_textobjects["f"] = ai.gen_spec.treesitter({ a = { "@function.outer" }, i = { "@function.inner" } })
  end,
}
