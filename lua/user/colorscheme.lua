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

lvim.colorscheme = "tokyonight-night"
