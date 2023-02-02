local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<M-UP>", ":resize -2<CR>", opts)
keymap("n", "<M-DOWN>", ":resize +2<CR>", opts)
keymap("n", "<M-LEFT>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-RIGHT>", ":vertical resize +2<CR>", opts)
