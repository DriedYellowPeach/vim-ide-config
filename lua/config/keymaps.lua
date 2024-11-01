local map = LazyVim.safe_keymap_set

local toggle_term = function()
  local lv = require("lazyvim.util.terminal")
  lv.open(nil, { cwd = ".", border = "rounded" })
end
map({ "n", "t" }, "<C-\\>", toggle_term, { desc = "Terminal (cwd)" })

-- NOTE: This is my old way to toggle Lazygit
map("n", "<leader>gg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git(), size = {
    width = 1,
    height = 1,
  } })
end, { desc = "Lazygit (Root Dir)" })

map("n", "<leader>gG", function()
  LazyVim.lazygit({ size = {
    width = 1,
    height = 1,
  } })
end, { desc = "Lazygit (cwd)" })

-- NOTE: Providing additional keymaps to navigate through diagnostics
map("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- NOTE: Disable orgiginal keymap: <c-k> - Signature Help(insert mode)
--  Cause this may confilict with my cmp keymaps
--  I like to navigate up and down the completion list with <c-j> and <c-k>
return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", false }
    end,
  },
}
