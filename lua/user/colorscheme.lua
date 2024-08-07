local gradient_color = {
	"#d0ff14",
	"#b8e02b",
	"#a5c73e",
	"#93b04f",
	"#7e9562",
	"#6a7a76",
	"#565f89",
}
require("tokyonight").setup({
	on_highlights = function(hl, colors)
		hl.CursorLineNr = {
			fg = gradient_color[1],
		}

		hl.LineNr0 = {
			fg = gradient_color[1],
		}
		hl.LineNr1 = {
			fg = gradient_color[2],
		}
		hl.LineNr2 = {
			fg = gradient_color[3],
		}
		hl.LineNr3 = {
			fg = gradient_color[4],
		}
		hl.LineNr4 = {
			fg = gradient_color[5],
		}
		hl.LineNr5 = {
			fg = gradient_color[6],
		}
		hl.LineNr6 = {
			fg = gradient_color[7],
		}

		hl.NvimTreeWinSeparator = {
			fg = colors.fg_gutter,
		}
		hl.LspCodeLensSeparator = {
			fg = colors.green1,
		}
		hl.LspInlayHint = {
			-- fg = "#6f7f9f",
			fg = colors.comment,
			bg = colors.bg,
		}
		hl.RenderMarkdownQuote = {
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
			bg = colors.bg_dark,
		}
		hl.StatusLineLspActive = {
			fg = "#0db9d7",
			bg = colors.bg_dark,
		}
	end,

	styles = {
		comments = { italic = true },
		keywords = { italic = false },
	},

	on_colors = function(colors)
		colors.border = colors.fg_gutter
	end,
})

lvim.colorscheme = "tokyonight"
