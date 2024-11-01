-- NOTE: Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.opt.timeoutlen = 250
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
  float = { border = "rounded" },
})
