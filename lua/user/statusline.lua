-- set status line below
lvim.builtin.lualine.options.minumu_width = 40

local components = require("lvim.core.lualine.components")
local colors = require("lvim.core.lualine.colors")

local compo_lsp = {
	function()
		local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
		if #buf_clients == 0 then
			return "%#StatusLineLspInactive#"
				.. " "
				.. ":["
				.. "%*"
				.. "LSP Inactive"
				.. "%#StatusLineLspInactive#"
				.. "]"
				.. "%*"
		end

		local buf_ft = vim.bo.filetype
		local buf_client_names = {}

		-- add client
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" and client.name ~= "copilot" then
				table.insert(buf_client_names, client.name)
			end
		end

		-- add formatter
		local formatters = require("lvim.lsp.null-ls.formatters")
		local supported_formatters = formatters.list_registered(buf_ft)
		vim.list_extend(buf_client_names, supported_formatters)

		-- add linter
		local linters = require("lvim.lsp.null-ls.linters")
		local supported_linters = linters.list_registered(buf_ft)
		vim.list_extend(buf_client_names, supported_linters)

		local unique_client_names = vim.fn.uniq(buf_client_names)

		local language_servers = "%#StatusLineLspActive#"
			.. " "
			.. ":["
			.. "%*"
			.. table.concat(unique_client_names, "%#StatusLineLspActive#" .. "|" .. "%*")
			.. "%#StatusLineLspActive#"
			.. "]"
			.. "%*"

		return language_servers
	end,
	cond = nil,
}

local comp_copilot = {
	"copilot",
	symbols = {
		status = {
			icons = {
				enabled = "",
				disabled = "",
				warning = "",
				unknown = "",
			},
			hl = {
				enabled = "#6cc644",
				disabled = "#6272A4",
				warning = "#ffc777",
				unknown = "#c53b53",
			},
		},
		spinners = require("copilot-lualine.spinners").dots_negative,
		spinner_color = "#6272A4",
	},
	show_colors = true,
	show_loading = true,
}

local comp_spaces = {
	function()
		local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
		return lvim.icons.ui.Tab .. " " .. shiftwidth
	end,
	color = {
		fg = colors.yellow,
	},
}

lvim.builtin.lualine.sections.lualine_x = {
	-- components.lsp,
	comp_copilot,
	components.treesitter,
	comp_spaces,
	components.filetype,
	compo_lsp,
}
