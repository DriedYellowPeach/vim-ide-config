local M = {}

function M.setup()
	local hlts = {}
	for i = 1, 6 do
		table.insert(hlts, "Headline" .. i)
	end

	require("render-markdown").setup({
		file_types = { "markdown", "norg", "rmd", "org" },
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
			backgrounds = hlts,
		},
		pipe_table = {
			border = {
				-- round table border
				"╭",
				"┬",
				"╮",
				"├",
				"┼",
				"┤",
				"╰",
				"┴",
				"╯",
				"│",
				"─",
			},
		},
	})
end

return M
