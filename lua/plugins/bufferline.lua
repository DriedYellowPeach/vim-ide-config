-- NOTE: Took me quite a while to figure out what these highlight group really goes for
-- What can I say, CSS is great, and browser which let you check CSS is even greater
-- Debug this is really a pain
return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      local bufferline = require("bufferline")
      local colors = require("tokyonight.colors").setup()
      local options = opts.options
      options.separator_style = "slant"
      options.style_preset = bufferline.style_preset.minimal
      options.diagnostics = false
      options.show_buffer_icons = false
      options.show_buffer_close_icons = false
      options.show_close_icon = false
      options.always_show_bufferline = true
      options.show_buffer_icons = true
      options.tab_size = 6

      opts.options.indicator = {
        style = "none",
      }

      -- NOTE: Acknowledgement: https://github.com/akinsho/bufferline.nvim/issues/859
      opts.highlights = {
        fill = {
          bg = colors.bg,
        },

        -- NOTE: These background should keep the same
        buffer_visible = {
          fg = colors.bg,
          bg = colors.fg_gutter,
        },

        background = {
          fg = colors.bg,
          bg = colors.fg_gutter,
        },

        separator_visible = {
          fg = colors.bg,
          bg = colors.fg_gutter,
        },
        separator = {
          fg = colors.bg,
          bg = colors.fg_gutter,
        },

        modified = {
          fg = colors.yellow,
          bg = colors.fg_gutter,
        },
        modified_visible = {
          fg = "#905f18",
          bg = colors.fg_gutter,
        },

        tab = {
          fg = colors.bg,
          bg = "#2a4287",
        },

        duplicate = {
          fg = colors.bg,
          bg = colors.fg_gutter,
          italic = false,
        },
        duplicate_visible = {
          fg = colors.bg,
          bg = colors.fg_gutter,
          italic = false,
        },

        -- NOTE: These background should keep the same
        buffer_selected = {
          fg = colors.bg_dark,
          bg = colors.fg,
          bold = true,
          italic = false,
        },
        separator_selected = {
          fg = colors.bg,
          bg = colors.fg,
        },
        tab_selected = {
          fg = colors.bg_dark,
          bg = colors.blue,
        },
        modified_selected = {
          fg = "#c08f48",
          bg = colors.fg,
        },
        duplicate_selected = {
          fg = colors.bg_dark,
          bg = colors.fg,
          italic = false,
        },
      }
    end,
  },
}
