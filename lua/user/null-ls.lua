-- format on save
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.rs", "*.go", "*.html", "*.java", "*.lua", "*.md", "*.py", "*.c", "*.cpp", "*.sh" }

-- formatters setup
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "prettier", filetypes = { "html", "css", "markdown" } },
	{ command = "rustfmt", filetypes = { "rust" }, args = { "--edition=2021" } },
	{ command = "google_java_format", filetypes = { "java" } },
	{
		command = "clang-format",
		filetypes = { "c", "cpp" },
		-- args = { "-style=file" },
		extra_args = { "--style={IndentWidth: 4}" },
	},
	{ command = "goimports", filetypes = { "go" } },
	{ command = "gofumpt", filetypes = { "go" } },
	{ command = "black", filetypes = { "python" } },
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "shfmt", filetypes = { "sh" } },
})

-- linters setup
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { command = "flake8", filetypes = { "python" } } })
