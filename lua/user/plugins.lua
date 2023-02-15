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
	"ray-x/go.nvim",
	"ray-x/guihua.lua",
	"leoluz/nvim-dap-go",
	{ "kevinhwang91/nvim-ufo", requires = { "kevinhwang91/promise-async" } },
	"psliwka/vim-smoothie",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
			require("leap").opts.highlight_unlabeled_phase_one_targets = true
		end,
	},
  {
    "NvChad/nvim-colorizer.lua",
  }
}
