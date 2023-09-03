local header = {
  [[                                                           ]],
  [[                        ___                                ]],
  [[  ___       __    __   /\_ \     __  __  __     ___ ___    ]],
  [[/' _ `\   / ,.`\ /\_\  \//\ \   /\ \/\ \/\_\  /' __` __`\  ]],
  [[/\ \/\ \ /\  __/ \/\ \   \_\ \_ \ \ \/ |\/\ \ /\ \/\ \/\ \ ]],
  [[\ \_\ \_\\ \____\ \ \ \  /\____\ \ \___/ \ \ \\ \_\ \_\ \_\]],
  [[ \/_/\/_/ \/____/  \/_/  \/____/  \/__/   \/_/ \/_/\/_/\/_/]],
  [[                                                           ]],
}

lvim.builtin.alpha.dashboard.section.header.val = header

local text = require "lvim.interface.text"
local lvim_version = require("lvim.utils.git").get_lvim_version()
lvim.builtin.alpha.dashboard.section.footer.val = text.align_center({ width = 0 }, {
  "",
  -- "🤓Happier Than Ever😎",
  "🙈🙉🙊",
  "When the people fear the goverment, there is tyranny.",
  "",
  lvim_version,
}, 0.5)
