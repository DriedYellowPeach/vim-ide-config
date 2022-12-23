lvim.plugins = {
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup(
        {
          text = {
            spinner = "moon",
            done = "👍🤓👍",
          },
        }
      )
    end,
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "p00f/clangd_extensions.nvim"
}

