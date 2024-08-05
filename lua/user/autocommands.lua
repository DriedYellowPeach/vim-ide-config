lvim.autocommands = {
	{
		"TextYankPost",
		{
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
			command = "startinsert | set winfixheight | setlocal statuscolumn= | setlocal nonumber norelativenumber",
		},
	},
	{
		"Filetype",
		{
			pattern = { "alpha", "dap-repl" },
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
				if vim.bo.filetype:find("dapui") then
					vim.opt_local.statuscolumn = ""
				end
				if vim.bo.buftype == "help" then
					vim.opt_local.statuscolumn = ""
				end
			end,
		},
	},
}
