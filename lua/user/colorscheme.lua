require("tokyonight").setup({
	on_highlights = function(hl, colors)
		hl.CursorLineNr = {
			fg = "#d0ff14",
		}
		hl.NvimTreeWinSeparator = {
			fg = colors.red1,
		}
		-- hl.LspCodeLens = {
		-- 	fg = colors.green,
		-- 	bg = colors.bg_dark,
		-- }
		-- hl.LspCodeLensSeparator = {
		-- 	fg = colors.teal,
		-- 	bg = colors.bg_dark,
		-- }
		hl.LspInlayHint = {
			fg = "#636d9f",
			bg = colors.bg_dark,
		}
		hl.Quote = {
			fg = colors.teal,
		}
		hl.CmpItemKindSnippet = {
			fg = colors.green,
		}
		hl.CmpGhostText = {
			fg = colors.comment,
		}
		hl.StatusLineLspInactive = {
			fg = "#e0af68",
			bg = "#1f2335",
		}
		hl.StatusLineLspActive = {
			fg = "#0db9d7",
			bg = "#1f2335",
		}
		-- hl.Visual = {
		-- 	reverse = true,
		-- }
	end,

	styles = {
		comments = { italic = true },
		keywords = { italic = false },
	},

	on_colors = function(colors)
		-- colors.border = "#7BA2F3"
		colors.border = colors.yellow
	end,
})

lvim.colorscheme = "tokyonight-moon"
