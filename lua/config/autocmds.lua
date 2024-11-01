-- disable spell checking for typst
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typst" }, -- Replace with your file types
  callback = function()
    vim.opt_local.spell = false
  end,
})
