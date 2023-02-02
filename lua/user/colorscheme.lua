require("tokyonight").setup({
	on_highlights = function(hl, colors)
		hl.CursorLineNr = {
			-- fg = colors.blue2,
			fg = "#d0ff14",
		}
	end,
})

lvim.colorscheme = "tokyonight-night"
