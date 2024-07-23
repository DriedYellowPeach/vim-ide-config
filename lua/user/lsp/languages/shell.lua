vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local defaults = require("lvim.lsp").get_common_opts()

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("bashls", {
	on_attach = defaults.on_attach,
	on_init = defaults.on_init,
	on_exit = defaults.on_exit,
	capabilities = defaults.capabilities,
})

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local bash_adapter_path = mason_path .. "bin/bash-debug-adapter"
local bashdb_dir = mason_path .. "packages/bash-debug-adapter/extension/bashdb_dir"

-- setup bash debug
local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.sh = {
	type = "executable",
	command = bash_adapter_path,
}

dap.configurations.sh = {
	{
		name = "Launch Bash Debugger",
		type = "sh",
		request = "launch",
		program = "${file}",
		cwd = "${fileDirname}",
		pathBashdb = bashdb_dir .. "/bashdb",
		pathBashdbLib = bashdb_dir,
		pathBash = "bash",
		pathCat = "cat",
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		env = {},
		args = {},
	},
}
