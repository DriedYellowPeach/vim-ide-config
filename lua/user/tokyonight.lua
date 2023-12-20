require("tokyonight").setup({
  on_highlights = function(hl, colors)
    hl.CursorLineNr = {
      fg = "#d0ff14",
    }
  end,

  styles = {
    comments = { italic = true },
    keywords = { italic = false },
  },

  on_colors = function(colors)
    colors.border = "#652020"
  end,
})

lvim.colorscheme = "tokyonight-moon"
-- lvim.colorscheme = "everforest"
-- create a highlight group called LSPInlayHints
-- vim.cmd("highlight LSPInlayHints guifg=#636da6")
vim.cmd([[autocmd ColorScheme * highlight LSPInlayHints guifg=#636da6]])
