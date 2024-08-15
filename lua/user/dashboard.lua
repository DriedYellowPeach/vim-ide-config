local alpha_hdr = lvim.builtin.alpha.dashboard.section.header
local alpha_bts = lvim.builtin.alpha.dashboard.section.buttons
local alpha_ftr = lvim.builtin.alpha.dashboard.section.footer

-- setup alpha header
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

local random_color = colors[math.random(1, #colors)]

vim.cmd(string.format("autocmd ColorScheme * highlight HeaderTxt cterm=bold gui=bold guifg=%s", random_color))

local header_simple3d = {
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

local header_slick = {
	[[                                           ]],
	[[                                           ]],
	[[                                           ]],
	[[                                           ]],
	[[╱╭━╮╱╭╮╱╭━━━╮╱╭━━╮╱╭╮╱╱╱╱╭╮╱╱╭╮╱╭━━╮╱╭━╮╭━╮]],
	[[╱┃┃╰╮┃┃╱┃╭━━╯╱╰┫┣╯╱┃┃╱╱╱╱┃╰╮╭╯┃╱╰┫┣╯╱┃┃╰╯┃┃]],
	[[╱┃╭╮╰╯┃╱┃╰━━╮╱╱┃┃╱╱┃┃╱╱╱╱╰╮┃┃╭╯╱╱┃┃╱╱┃╭╮╭╮┃]],
	[[╱┃┃╰╮┃┃╱┃╭━━╯╱╱┃┃╱╱┃┃╱╭╮╱╱┃╰╯┃╱╱╱┃┃╱╱┃┃┃┃┃┃]],
	[[╱┃┃╱┃┃┃╱┃╰━━╮╱╭┫┣╮╱┃╰━╯┃╱╱╰╮╭╯╱╱╭┫┣╮╱┃┃┃┃┃┃]],
	[[╱╰╯╱╰━╯╱╰━━━╯╱╰━━╯╱╰━━━╯╱╱╱╰╯╱╱╱╰━━╯╱╰╯╰╯╰╯]],
	[[                                           ]],
	[[                                           ]],
}

local header_chrome = {
	[[                        ]],
	[[                        ]],
	[[                        ]],
	[[                        ]],
	[[╔╗╔ ╔═╗ ╦ ╦   ╦  ╦ ╦ ╔╦╗]],
	[[║║║ ║╣  ║ ║   ╚╗╔╝ ║ ║║║]],
	[[╝╚╝ ╚═╝ ╩ ╩═╝  ╚╝  ╩ ╩ ╩]],
	[[                        ]],
	[[                        ]],
}

local header_simpleblock = {
	[[                                                                      ]],
	[[                                                                      ]],
	[[                                                                      ]],
	[[                                                                      ]],
	[[_|      _|  _|_|_|_|  _|_|_|  _|        _|      _|  _|_|_|  _|      _|]],
	[[_|_|    _|  _|          _|    _|        _|      _|    _|    _|_|  _|_|]],
	[[_|  _|  _|  _|_|_|      _|    _|        _|      _|    _|    _|  _|  _|]],
	[[_|    _|_|  _|          _|    _|          _|  _|      _|    _|      _|]],
	[[_|      _|  _|_|_|_|  _|_|_|  _|_|_|_|      _|      _|_|_|  _|      _|]],
	[[                                                                      ]],
	[[                                                                      ]],
}

local header_block = {
	[[                                                          ]],
	[[                                                          ]],
	[[                                                          ]],
	[[                                                          ]],
	[[███╗   ██╗ ███████╗ ██╗ ██╗      ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[████╗  ██║ ██╔════╝ ██║ ██║      ██║   ██║ ██║ ████╗ ████║]],
	[[██╔██╗ ██║ █████╗   ██║ ██║      ██║   ██║ ██║ ██╔████╔██║]],
	[[██║╚██╗██║ ██╔══╝   ██║ ██║      ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[██║ ╚████║ ███████╗ ██║ ███████╗  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[╚═╝  ╚═══╝ ╚══════╝ ╚═╝ ╚══════╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
	[[                                                          ]],
	[[                                                          ]],
}

local header_simple = {
	[[                                                ]],
	[[                                                ]],
	[[                                                ]],
	[[                                                ]],
	[[ _  _   ___   ___   _     _    _   ___   _    _ ]],
	[[| \| | | __| |_ _| | |    \ \ / / |_ _| | \  / |]],
	[[| .` | | _|   | |  | |__   \ V /   | |  | |\/| |]],
	[[|_|\_| |___| |___| |____|   \_/   |___| |_|  |_|]],
	[[                                                ]],
	[[                                                ]],
}

local header_texts = {
	header_simple,
	header_slick,
	header_simple3d,
	header_chrome,
	header_simpleblock,
	header_block,
}

alpha_hdr.val = header_texts[math.random(1, #header_texts)]
alpha_hdr.opts.hl = "HeaderTxt"

-- setup alpha footer
local text = require("lvim.interface.text")
alpha_ftr.val = text.align_center({ width = 0 }, {
	"",
	"",
	"🙈🙉🙊",
	"When government fears the people, there is liberty.",
	"When the people fear the government, there is tyranny.",
	"",
	-- lvim_version,
}, 0.5)

vim.cmd(
	string.format(
		"autocmd ColorScheme * highlight FooterTxt cterm=bold cterm = italic gui=bold,italic guifg=%s",
		random_color
	)
)
alpha_ftr.opts.hl = "FooterTxt"

-- setup alpha buttons
vim.cmd(string.format("autocmd ColorScheme * highlight ButtonTxt cterm=bold gui=bold guifg=bg guibg=%s", random_color))
alpha_bts.opts.hl = "HeaderTxt"
alpha_bts.opts.hl_shortcut = "ButtonTxt"
alpha_bts.entries = {
	{ "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
	{ "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
	{ "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
	{ "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
	{
		"c",
		lvim.icons.ui.Gear .. "  Configuration",
		"<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
	},
	{ "q", "󰩈" .. "  Quit", "<CMD>quit<CR>" },
}
