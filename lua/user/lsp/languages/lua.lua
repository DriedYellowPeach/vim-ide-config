local M = {}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "lua_ls" })

function M.setup()
	local defaults = require("lvim.lsp").get_common_opts()
	local original_setting = require("lvim.lsp.providers.lua_ls").settings
	original_setting.Lua.runtime = {
		version = "Lua 5.4",
	}
	original_setting.Lua.hint = {
		enable = true,
		setType = true,
		paramType = true,
		paramName = "All",
		semicolon = "Disable",
		arrayIndex = "Enable",
	}

	vim.list_extend(original_setting.Lua.workspace.library, {
		-- 	"/Users/neil/.local/share/lunarvim/site/pack/lazy/opt",
		os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack",
	})

	local lsp_manager = require("lvim.lsp.manager")
	lsp_manager.setup("lua_ls", {
		on_attach = function(client, bufnr)
			defaults.on_attach(client, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end,
		on_init = defaults.on_init,
		on_exit = defaults.on_exit,
		capabilities = defaults.capabilities,
		settings = original_setting,
	})

	local status_ok, dap = pcall(require, "dap")
	if not status_ok then
		return
	end

	-- setup the adapters
	dap.adapters.nlua = function(callback, conf)
		local adapter = {
			type = "server",
			host = conf.host or "127.0.0.1",
			port = conf.port or 8086,
		}
		if conf.start_neovim then
			local dap_run = dap.run
			dap.run = function(c)
				adapter.port = c.port
				adapter.host = c.host
			end
			require("osv").run_this()
			dap.run = dap_run
		end
		callback(adapter)
	end

	dap.configurations.lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Run this file",
			start_neovim = {},
		},
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance (port = 8086)",
			port = 8086,
		},
	}
end

return M
