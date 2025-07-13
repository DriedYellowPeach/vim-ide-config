-- NOTE: Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.opt.timeoutlen = 250
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
  float = { border = "rounded" },
})

-- NOTE: Trying to disable automatically adding comment symbol when enter new line
-- `vim.opt.formatoptions:remove("c")` doesn't work for me
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_python_lsp = "basedpyright"
