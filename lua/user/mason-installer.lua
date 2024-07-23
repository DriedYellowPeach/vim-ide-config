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
		-- java
		"google-java-format",
		"groovy-language-server",
		"java-debug-adapter",
		"java-test",
		"jdtls",
		-- go
		"gopls",
		"json-lsp",
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
	auto_update = false,
	run_on_start = true,
	start_delay = 3000,
	debounce_hours = 5,
})
