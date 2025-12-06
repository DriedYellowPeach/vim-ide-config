-- NOTE: Disable original keymap: <c-k> - Signature Help(insert mode)
--  Cause this may confilict with my cmp keymaps
--  I like to navigate up and down the completion list with <c-j> and <c-k>
-- local keys = require("lazyvim.plugins.lsp.keymaps").get()
-- keys[#keys + 1] = { "<c-k>", false, mode = "i" }

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Disable a keymap
          { "<c-k>", false },
        },
      },
    },
  },
}
