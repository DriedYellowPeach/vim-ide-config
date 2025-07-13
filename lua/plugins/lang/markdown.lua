return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = ":call mkdp#util#install()",
  },
  {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        code = {
          sign = true,
          width = "block",
          right_pad = 1,
        },
        heading = {
          sign = false,
          icons = {},
        },
        checkbox = {
          enabled = true,
        },
      },
      ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
      config = function(_, opts)
        require("render-markdown").setup(opts)
        Snacks.toggle({
          name = "Render Markdown",
          get = function()
            return require("render-markdown.state").enabled
          end,
          set = function(enabled)
            local m = require("render-markdown")
            if enabled then
              m.enable()
            else
              m.disable()
            end
          end,
        }):map("<leader>um")
      end,
    },
  },
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown", -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    opts = {
      -- Your configuration here (optional)
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.markdownlint_cli2.with({
          extra_args = { "--config", "/Users/neil/source/dot-files/vim-ide-config/.markdownlint-cli2.yaml" },
        }),
      })
    end,
  },
}
