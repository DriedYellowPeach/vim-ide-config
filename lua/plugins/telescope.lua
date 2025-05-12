-- NOTE: this change the original lazyvim telescope style
-- I really hate the bottom up settings!
local defaults = require("telescope.themes").get_dropdown()
defaults.wrap_results = true
defaults.file_ignore_patterns = {
  ".DS_Store",
}

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = defaults,
    },
  },
}
