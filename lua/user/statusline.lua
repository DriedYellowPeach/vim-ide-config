-- set status line below
lvim.builtin.lualine.options.minumu_width = 40

local components = require("lvim.core.lualine.components")

local compo_lsp = {
	function()
		local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
		if #buf_clients == 0 then
			return "%#DiagnosticWarn#" .. " " .. ":[" .. "%*" .. "LSP Inactive" .. "%#DiagnosticWarn#" .. "]" .. "%*"
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

		local language_servers = "%#DiagnosticInfo#"
			.. " "
			.. ":["
			.. "%*"
			.. table.concat(unique_client_names, "%#DiagnosticInfo#" .. "|" .. "%*")
			.. "%#DiagnosticInfo#"
			.. "]"
			.. "%*"

		return language_servers
	end,
	color = { gui = "bold" },
	cond = nil,
}

local compo_copilot = {
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

lvim.builtin.lualine.sections.lualine_x = {
	-- components.lsp,
	compo_copilot,
	components.treesitter,
	components.spaces,
	components.filetype,
	compo_lsp,
}
