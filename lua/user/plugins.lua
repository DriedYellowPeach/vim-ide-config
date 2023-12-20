lvim.plugins = {
	-- plugin for rust lsp
	{
		"simrat39/rust-tools.nvim",
	},
	{
		"saecki/crates.nvim",
		-- version = "v0.3.0",
		event = { "BufRead Cargo.toml" },
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
	-- plugin for showing process of language server
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				progress = {
					display = {
						progress_icon = { pattern = "moon", period = 1 },
						done_icon = "👍🤓👍",
					},
				},

				notification = {
					-- override_vim_notify = true,
					window = {
						-- normal_hl = "Normal",
						border = "rounded",
						winblend = 20,
					},
				},
			})
		end,
	},
	-- plugin for selecting more kinds of textobjects, function for example
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		event = "BufReadPre",
		commit = "a60af980b6f0a6e7ee239ffb9d1d519aaaa1de58",
	},
	-- plugin for clang ide setup
	"p00f/clangd_extensions.nvim",
	-- plugins for go ide setup
	"ray-x/go.nvim",
	"ray-x/guihua.lua",
	"leoluz/nvim-dap-go",
	-- pulgins for fold and expand code
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = { "kevinhwang91/promise-async" },
	},
	"psliwka/vim-smoothie",
	-- plugin for jumping to anywhere blazingly fast
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
			require("leap").opts.highlight_unlabeled_phase_one_targets = true
		end,
	},
	-- plugin for colorize 256-bit hex color bytes
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
	},
	-- plugin for copilot
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
					auto_trigger = false,
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				insert_text = require("copilot_cmp.format").remove_existing,
			})
		end,
	},
	-- plugin for preview markdown
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({
				border = "double",
			})
		end,
		cmd = "Glow",
	},
	-- plugin for java lsp
	"mfussenegger/nvim-jdtls",
	-- plugin for python lsp
	{
		"AckslD/swenv.nvim",
		config = function()
			require("swenv").setup({
				venvs_path = vim.fn.expand("~/Library/Caches/pypoetry/virtualenvs"),
			})
		end,
		event = { "BufRead", "BufNew" },
	},
	"stevearc/dressing.nvim",
	"mfussenegger/nvim-dap-python",
	{
		"nvim-neotest/neotest",
		event = { "BufReadPost", "BufNew" },
	},
	{
		"nvim-neotest/neotest-python",
		event = { "BufEnter *.py" },
	},
	-- plugin for html autotag
	"windwp/nvim-ts-autotag",
	-- nvim-surround plugin
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
  -- install mason tool automatically
  "WhoIsSethDaniel/mason-tool-installer.nvim",
}
