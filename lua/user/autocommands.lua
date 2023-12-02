lvim.autocommands = {
	{
		"TextYankPost",
		{
			-- group = "custom_buffer",
			pattern = "*",
			desc = "Highlight text on yank",
			callback = function()
				vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
			end,
		},
	},
	{
		"TermOpen",
		{
			pattern = "zsh",
			desc = "Enter insert mode when open a shell",
			command = "startinsert | set winfixheight",
		},
	},
}
