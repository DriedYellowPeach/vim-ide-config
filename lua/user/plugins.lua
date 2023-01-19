lvim.plugins = {
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		require = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
				popup = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "moon",
					done = "👍🤓👍",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		commit = "a60af980b6f0a6e7ee239ffb9d1d519aaaa1de58",
	},
	"p00f/clangd_extensions.nvim",
	-- "olexsmir/gopher.nvim",
	-- {
	-- 	"ray-x/go.nvim",
	-- 	config = function()
	-- 		require("go").setup()
	-- 	end,
	-- 	-- require = { "ray-x/guihua.lua" },
	-- },
	"ray-x/go.nvim",
	"ray-x/guihua.lua",
	"leoluz/nvim-dap-go",
}
