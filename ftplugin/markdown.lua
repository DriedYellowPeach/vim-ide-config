vim.g.markdown_recommended_style = 0
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.spelllang = "en_us"
vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.conceallevel = 3

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
		name = "Markdown Magic 󱡃",
		t = {
			function()
				require("user.utils.toggle").check_box()
			end,
			"Toggle TODO Box",
		},
	},
}

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.register(mappings, opts)
