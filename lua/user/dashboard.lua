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

-- setup alpha header
vim.cmd(string.format("autocmd ColorScheme * highlight HeaderTxt cterm=bold gui=bold guifg=%s", random_color))
local headers = require("user.utils.artwork").headers()
alpha_hdr.val = require("user.utils.artwork").headers()[math.random(1, #headers)]
alpha_hdr.opts.hl = "HeaderTxt"

-- setup alpha footer
local function footer_text()
	local stats = require("lazy").stats()
	local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
	local lazy_info = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms ⚡"

	local art_text = require("user.utils.artwork").ascii_art()
	art_text[#art_text + 1] = lazy_info

	return art_text
end

vim.api.nvim_create_autocmd("User", {
	once = true,
	pattern = "LazyVimStarted",
	callback = function()
		require("alpha.themes.dashboard").section.footer.val = footer_text()
		pcall(vim.cmd.AlphaRedraw)
	end,
})

vim.cmd(string.format("autocmd ColorScheme * highlight FooterTxt cterm=bold gui=bold guifg=%s", random_color))
alpha_ftr.opts.hl = "FooterTxt"

-- setup alpha buttons
vim.cmd(string.format("autocmd ColorScheme * highlight ButtonTxt cterm=bold gui=bold guifg=bg guibg=%s", random_color))
alpha_bts.opts.hl = "HeaderTxt"
alpha_bts.opts.hl_shortcut = "ButtonTxt"
alpha_bts.entries = {
	{ "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
	-- too narrow space for now, disable this entry
	-- { "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
	{ "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
	{ "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
	{
		"c",
		lvim.icons.ui.Gear .. "  Configuration",
		"<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
	},
	{ "q", "󰩈" .. "  Quit", "<CMD>quit<CR>" },
}
