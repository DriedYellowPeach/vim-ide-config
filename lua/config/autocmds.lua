vim.api.nvim_create_autocmd("FileType", {
  pattern = "wgsl",
  callback = function()
    vim.bo.shiftwidth = 4
  end,
})
