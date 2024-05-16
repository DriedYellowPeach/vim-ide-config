-- Some customization for inlay hints
-- Using some speical symbols for fancy look and feel
require("lsp-inlayhints").setup({
	inlay_hints = {
		parameter_hints = {
			show = true,
			prefix = "󰡱 ",
			separator = ", ",
		},
		type_hints = {
			show = true,
			prefix = "󰍛 ",
			separator = ", ",
			remove_colon_start = true,
			remove_colon_end = true,
		},
	},
})
