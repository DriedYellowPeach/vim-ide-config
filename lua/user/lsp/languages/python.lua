vim.list_extend(lvim.builtin.treesitter.ensure_installed, { "python" })
-- setup formatting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({ { name = "black" } })
-- lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { command = "flake8", filetypes = { "python" } } })

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)
