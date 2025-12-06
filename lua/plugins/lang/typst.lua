vim.filetype.add({ extension = { typ = "typst" } })

-- disable spell checking for typst
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typst" }, -- Replace with your file types
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.lsp.config["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  settings = {
    exportPdf = "onType",
    outputPath = "$root/target/$dir/$name",
  },
}

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
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
}
