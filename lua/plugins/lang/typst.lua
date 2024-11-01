vim.filetype.add({ extension = { typ = "typst" } })

return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
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
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
          settings = {
            exportPdf = "onType",
            outputPath = "$root/target/$dir/$name",
          },
        },
      },
    },
  },
}
