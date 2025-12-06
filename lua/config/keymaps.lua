local map = LazyVim.safe_keymap_set

local toggle_term = function()
  Snacks.terminal.toggle(nil, { cwd = ".", win = {
    style = "float",
    border = "rounded",
  } })
  -- local lv = require("lazyvim.util.terminal")
  -- lv.open(nil, { cwd = ".", border = "rounded" })
end
map({ "n", "t" }, "<C-\\>", toggle_term, { desc = "Terminal (cwd)" })
map({ "n", "t" }, "<C-t>", toggle_term, { desc = "Terminal (cwd)" })

-- NOTE: This is my old way to toggle Lazygit
map("n", "<leader>gg", function()
  Snacks.lazygit.open({
    cwd = LazyVim.root.git(),
    win = {
      height = 0,
      width = 0,
    },
  })
end, { desc = "Lazygit (Root Dir)" })

map("n", "<leader>gG", function()
  Snacks.lazygit.open({
    win = {
      height = 1,
      width = 1,
    },
  })
end, { desc = "Lazygit (cwd)" })

-- NOTE: Providing additional keymaps to navigate through diagnostics
map("n", "<leader>cn", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })

map("n", "<leader>cp", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev Diagnostic" })
