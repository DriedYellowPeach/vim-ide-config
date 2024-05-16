local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	m = {
		name = "Python 󱡃",
		c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
		m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
		M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
		f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
		F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
		S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
	},
}

which_key.register(mappings, opts)
