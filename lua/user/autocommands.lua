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
	{
		"Filetype",
		{
			pattern = { "alpha" },
			desc = "disable status column for certain type of buffers",
			callback = function()
				vim.opt_local.statuscolumn = ""
			end,
		},
	},
	{
		"BufEnter",
		{
			callback = function()
				if vim.bo.filetype == "NvimTree" then
					vim.opt_local.statuscolumn = ""
				end
				if vim.bo.buftype == "terminal" then
					vim.opt_local.statuscolumn = ""
				end
				if vim.bo.buftype == "help" then
					vim.opt_local.statuscolumn = ""
				end
			end,
		},
	},
}
