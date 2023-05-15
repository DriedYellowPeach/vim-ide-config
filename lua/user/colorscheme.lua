require("tokyonight").setup({
  on_highlights = function(hl, colors)
    hl.CursorLineNr = {
      fg = "#d0ff14",
    }
  end,

  on_colors = function(colors)
    colors.border = "#652020"
  end,
})

lvim.colorscheme = "tokyonight-moon"

-- setup highlight for fidget
vim.cmd([[autocmd ColorScheme * highlight FidgetTitle cterm=bold gui=bold guifg=#73daca]])
vim.cmd([[autocmd ColorScheme * highlight FidgetTask guifg=#5891d7]])
