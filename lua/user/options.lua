vim.opt.timeoutlen = 125
vim.opt.relativenumber = true
vim.opt.cursorcolumn = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.virtualedit = "block"
vim.opt.fillchars = {
	horiz = "═",
	vert = "║",
	horizup = "╩",
	horizdown = "╦",
	vertright = "╠",
	vertleft = "╣",
	verthoriz = "╬",
}

lvim.builtin.indentlines.options.show_current_context = true
lvim.keys.term_mode["<esc>"] = "<C-\\><C-n>"
