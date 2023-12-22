local header = {
  [[                                                           ]],
  [[                                                           ]],
  [[                                                           ]],
  [[                        ___                                ]],
  [[  ___       __    __   /\_ \     __  __  __     ___ ___    ]],
  [[/' _ `\   / ,.`\ /\_\  \//\ \   /\ \/\ \/\_\  /' __` __`\  ]],
  [[/\ \/\ \ /\  __/ \/\ \   \_\ \_ \ \ \/ |\/\ \ /\ \/\ \/\ \ ]],
  [[\ \_\ \_\\ \____\ \ \ \  /\____\ \ \___/ \ \ \\ \_\ \_\ \_\]],
  [[ \/_/\/_/ \/____/  \/_/  \/____/  \/__/   \/_/ \/_/\/_/\/_/]],
  [[                                                           ]],
  [[                                                           ]],
}

lvim.builtin.alpha.dashboard.section.header.val = header

local text = require "lvim.interface.text"
local lvim_version = require("lvim.utils.git").get_lvim_version()
lvim.builtin.alpha.dashboard.section.footer.val = text.align_center({ width = 0 }, {
  "",
  "",
  "",
  "🙈🙉🙊",
  "When the people fear the goverment, there is tyranny.",
  "",
  -- lvim_version,
}, 0.5)

vim.cmd([[autocmd ColorScheme * highlight FOOTERTXT cterm=bold cterm=italic gui=bold,italic guifg=#fca7ea]])
lvim.builtin.alpha.dashboard.section.footer.opts.hl = "FOOTERTXT"

lvim.builtin.alpha.dashboard.section.buttons.entries = {
      { "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
      { "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
      { "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
      { "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
      {
        "c",
        lvim.icons.ui.Gear .. "  Configuration",
        "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
      },
      { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
}
