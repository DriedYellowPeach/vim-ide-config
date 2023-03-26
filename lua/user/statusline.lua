-- set status line below
local components = require("lvim.core.lualine.components")


lvim.builtin.lualine.sections.lualine_x = {
  components.lsp,
  components.treesitter,
	components.filetype,
}
