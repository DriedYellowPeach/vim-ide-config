vim.opt.timeoutlen = 125
vim.opt.relativenumber = true
vim.opt.cursorcolumn = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.virtualedit = "block"
-- vim.opt.fillchars = {
-- 	horiz = "═",
-- 	vert = "║",
-- 	horizdown = "╦",
-- 	horizup = "╩",
-- 	vertright = "╠",
-- 	vertleft = "╣",
-- 	verthoriz = "╬",
-- }

local column_sep = "┋"
vim.opt.statuscolumn = vim.v.relnum .. column_sep
vim.opt.statuscolumn = '%s%=%#LineNr6#%{(v:relnum >= 6)?v:relnum." '
	.. column_sep
	.. ' ":""}'
	.. '%#LineNr5#%{(v:relnum == 5)?v:relnum." '
	.. column_sep
	.. ' ":""}'
	.. '%#LineNr4#%{(v:relnum == 4)?v:relnum." '
	.. column_sep
	.. ' ":""}'
	.. '%#LineNr3#%{(v:relnum == 3)?v:relnum." '
	.. column_sep
	.. ' ":""}'
	.. '%#LineNr2#%{(v:relnum == 2)?v:relnum." '
	.. column_sep
	.. ' ":""}'
	.. '%#LineNr1#%{(v:relnum == 1)?v:relnum." '
	.. column_sep
	.. ' ":""}'
	.. '%#LineNr0#%{(v:relnum == 0)?v:lnum." '
	.. column_sep
	.. ' ":""}'

lvim.builtin.indentlines.options.show_current_context = true
lvim.keys.term_mode["<esc>"] = "<C-\\><C-n>"
