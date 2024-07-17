vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "lua_ls" })

local defaults = require("lvim.lsp").get_common_opts()
local old_setting = require("lvim.lsp.providers.lua_ls").settings
old_setting.Lua.hint = {
	enable = true,
	setType = true,
	paramType = true,
	paramName = "All",
	semicolon = "Disable",
	arrayIndex = "Enable",
}

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("lua_ls", {
	on_attach = function(client, bufnr)
		defaults.on_attach(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
	on_init = defaults.on_init,
	on_exit = defaults.on_exit,
	capabilities = defaults.capabilities,
	settings = old_setting,
})
