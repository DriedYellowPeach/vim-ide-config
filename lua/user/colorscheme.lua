require("tokyonight").setup({
	on_highlights = function(hl, colors)
		hl.CursorLineNr = {
			-- fg = colors.blue2,
      fg = "#d0ff14"
      -- fg = "#00ff40",
			-- fg = "#feda23"
		}
	end,
})

lvim.colorscheme = "tokyonight-night"
