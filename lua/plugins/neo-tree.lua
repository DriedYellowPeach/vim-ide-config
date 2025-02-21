return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- NOTE: Make neotree can follow current file even it's not in root dir
      { "<leader>E", "<cmd>Neotree reveal_force_cwd<cr>", desc = "Exploer (Everywhere)" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          never_show = {
            "__pycache__",
          },
        },
      },
    },
  },
}
