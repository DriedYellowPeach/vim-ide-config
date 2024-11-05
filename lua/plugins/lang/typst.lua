vim.filetype.add({ extension = { typ = "typst" } })

return {
  {
    "stevearc/conform.nvim",
    opts = function()
      require("conform").setup({
        formatters_by_ft = {
          typst = { "typstyle" },
        },
        formatters = {
          typstyle = {
            -- Change where to find the command
            command = "/opt/homebrew/bin/typstyle",
            args = {},
            stdin = true,
          },
        },
      })
    end,
  },

  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    build = function()
      require("typst-preview").update()
    end,
  },
  -- NOTE: using tinymist as typst language server
  -- https://github.com/Myriad-Dreamin/tinymist
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        tinymist = {
          -- FIX: https://github.com/igorlfs/dotfiles/commit/51199d1a33a5fa28f198a6dcd6858aad8e5e106c#diff-4294c316cad3cabb99eaf4879fa9556e579283822b1c4dab0f92f18d2ce32f0eR2
          offset_encoding = "utf-8",
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          -- NOTE: See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
          settings = {
            exportPdf = "onType",
            outputPath = "$root/target/$dir/$name",
          },
        },
      },
    },
  },
}
