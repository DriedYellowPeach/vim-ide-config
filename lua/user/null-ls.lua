-- format on save
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = {
	"*.rs",
	"*.go",
	"*.html",
	"*.java",
	"*.lua",
	"*.md",
	"*.py",
	"*.c",
	"*.cpp",
	"*.sh",
	"*.typ",
}

-- formatters setup
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "prettier", filetypes = { "html", "css", "markdown" } },
	-- { command = "rustfmt", filetypes = { "rust" }, args = { "--edition=2021" } },
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
	-- { command = "typstfmt", filetypes = { "typst" } },
	{ name = "typstyle", filetypes = { "typst" } },
})

-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
-- 	{ name = "shellcheck", filetypes = { "sh" } },
-- })

local nls = require("null-ls")
nls.setup({
	sources = {
		nls.builtins.completion.spell.with({
			filetypes = { "markdown", "typst" },
		}),
	},
})
