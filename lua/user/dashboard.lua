local alpha_hdr = lvim.builtin.alpha.dashboard.section.header
local alpha_bts = lvim.builtin.alpha.dashboard.section.buttons
local alpha_ftr = lvim.builtin.alpha.dashboard.section.footer

-- setup alpha header
math.randomseed(os.time())
local colors = { "cyan", "yellow", "white", "violet", "lightyellow" }

local random_color = colors[math.random(1, #colors)]

vim.cmd(string.format("autocmd ColorScheme * highlight HeaderTxt cterm=bold gui=bold guifg=%s", random_color))

local header_txt = {
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

alpha_hdr.val = header_txt
alpha_hdr.opts.hl = "HeaderTxt"

-- setup alpha footer
local text = require("lvim.interface.text")
-- local lvim_version = require("lvim.utils.git").get_lvim_version()
alpha_ftr.val = text.align_center({ width = 0 }, {
	"",
	"",
	"",
	"🙈🙉🙊",
	"When the people fear the goverment, there is tyranny.",
	"",
	-- lvim_version,
}, 0.5)

vim.cmd(
	string.format(
		"autocmd ColorScheme * highlight FooterTxt cterm=bold cterm = italic gui=bold,italic guifg=%s",
		random_color
	)
)
-- vim.cmd([[autocmd ColorScheme * highlight FOOTERTXT cterm=bold cterm=italic gui=bold,italic guifg=#fca7ea]])
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
	{ "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
}
