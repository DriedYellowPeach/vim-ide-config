local function random_color()
  math.randomseed(os.time())
  local colors = {
    "lightred",
    "#fca7ea",
    "lightyellow",
    "darkyellow",
    "gold",
    "orange",
    "lightblue",
    "skyblue",
    "azure",
    "bisque",
    "silver",
    "lightgreen",
    "forestgreen",
    "ivory",
  }

  return colors[math.random(1, #colors)]
end

local some_color = random_color()

-- TODO: add gradient colors to LineNr
-- Maybe consider using the Bars-N-Lines plugin?
local gradient_color = {
  "#d0ff14",
  "#b8e02b",
  "#a5c73e",
  "#93b04f",
  "#7e9562",
  "#6a7a76",
  "#565f89",
}

return {
  { "rose-pine/neovim", name = "rose-pine", opts = {
    variant = "dawn",
  } },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      on_highlights = function(hl, colors)
        hl.CursorLineNr = {
          fg = gradient_color[1],
        }
        hl.CursorLineNr = {
          fg = gradient_color[1],
        }

        hl.LineNr0 = {
          fg = gradient_color[1],
        }
        hl.LineNr1 = {
          fg = gradient_color[2],
        }
        hl.LineNr2 = {
          fg = gradient_color[3],
        }
        hl.LineNr3 = {
          fg = gradient_color[4],
        }
        hl.LineNr4 = {
          fg = gradient_color[5],
        }
        hl.LineNr5 = {
          fg = gradient_color[6],
        }
        hl.LineNr6 = {
          fg = gradient_color[7],
        }

        hl.DashboardHeader = {
          fg = some_color,
          bold = true,
        }

        hl.DashboardFooter = {
          fg = some_color,
          bold = true,
          -- italic = true,
        }

        hl.DashboardDesc = {
          fg = some_color,
          bold = true,
        }

        hl.DashboardKey = {
          fg = "bg",
          bg = some_color,
          -- fg = some_color,
          bold = true,
        }

        hl.DashboardHalfCircle = {
          fg = some_color,
          bold = true,
        }

        hl.DashboardIcon = {
          fg = some_color,
          bold = true,
        }

        hl.StatusLineLspInactive = {
          fg = "#e0af68",
          bg = colors.bg_dark,
        }

        hl.StatusLineLspActive = {
          fg = "#0db9d7",
          bg = colors.bg_dark,
        }

        hl.RenderMarkdownDash = {
          fg = "#3b4261",
        }
      end,

      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },

      on_colors = function(colors)
        colors.border = colors.fg_gutter
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
