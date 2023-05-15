-- set status line below
lvim.builtin.lualine.options.minumu_width = 40

local components = require("lvim.core.lualine.components")

local lsp = components.lsp
lsp.cond = nil

lvim.builtin.lualine.sections.lualine_x = {
  -- components.lsp,
  lsp,
  components.treesitter,
  components.filetype,
  components.spaces
}

-- lvim.builtin.lualine.options.minumu_width = 40
