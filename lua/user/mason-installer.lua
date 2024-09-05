local M = {}

function M.setup()
	require("mason-tool-installer").setup({
		ensure_installed = {
			-- shell
			"bash-language-server",
			"shellcheck",
			"shfmt",
			"bash-debug-adapter",
			-- python
			"black",
			"debugpy",
			"flake8",
			"pyright",
			-- clang
			"clangd",
			"codelldb",
			-- web
			"css-lsp",
			"emmet-ls",
			"html-lsp",
			"tailwindcss-language-server",
			"typescript-language-server",
			"vtsls",
			"js-debug-adapter",
			-- java
			"google-java-format",
			"groovy-language-server",
			"java-debug-adapter",
			"java-test",
			"jdtls",
			-- go
			"gopls",
			-- "json-lsp",
			-- lua
			"stylua",
			"lua-language-server",
			-- rust
			"rust-analyzer",
			-- extral
			"lemminx",
			"yaml-language-server",
			"vim-language-server",
			"perlnavigator",
			"prettier",
		},
	})
end

return M
