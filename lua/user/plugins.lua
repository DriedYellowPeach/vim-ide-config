lvim.plugins = {
	-- plugin for rust IDE
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		ft = "rust",
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
		event = { "BufReadPre", "User FileOpened" },
		tag = "v1.4.5",
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
						max_width = 50,
						max_height = 25,
					},
				},

				integration = {
					["nvim-tree"] = {
						enable = false,
					},
				},
			})
		end,
	},

	-- plugin for selecting more kinds of textobjects, function for example
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufReadPre", "User FileOpened" },
	},
	-- plugin for clang ide setup
	{
		"p00f/clangd_extensions.nvim",
		ft = { "c", "cpp" },
	},
	-- plugins for go ide setup
	{ "olexsmir/gopher.nvim", ft = "go" },
	{ "leoluz/nvim-dap-go", ft = "go" },
	-- pulgins for fold and expand code
	{
		"kevinhwang91/nvim-ufo",
		config = function()
			require("user.ufo").setup()
		end,
		event = { "BufReadPre", "User FileOpened" },
		dependencies = { "kevinhwang91/promise-async" },
	},
	{ "psliwka/vim-smoothie", event = "VeryLazy" },
	-- plugin for jumping to anywhere blazingly fast
	{
		"ggandor/leap.nvim",
		-- event = "VeryLazy",
		event = { "BufReadPre", "User FileOpened" },
		config = function()
			require("leap").add_default_mappings()
			require("leap").opts.highlight_unlabeled_phase_one_targets = true
		end,
	},
	-- plugin for colorize 256-bit hex color bytes
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "User FileOpened" },
		config = function()
			require("user.colorizer").setup()
		end,
	},
	-- plugin for copilot
	{
		"zbirenbaum/copilot.lua",
		event = { "BufReadPre", "User FileOpened" },
		config = function()
			require("copilot").setup({
				-- suggestion = {
				-- 	enabled = false,
				-- 	auto_trigger = false,
				-- },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = { "BufReadPre", "User FileOpened" },
		config = function()
			require("copilot_cmp").setup({
				insert_text = require("copilot_cmp.format").remove_existing,
			})
		end,
	},
	-- plugin for copilot status
	{ "AndreM222/copilot-lualine" },
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
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	-- plugin for python lsp
	{
		"AckslD/swenv.nvim",
		config = function()
			require("swenv").setup({
				venvs_path = vim.fn.expand("~/Library/Caches/pypoetry/virtualenvs"),
			})
		end,
		ft = "python",
	},
	{ "stevearc/dressing.nvim", event = { "BufReadPre", "User FileOpened" } },
	{ "mfussenegger/nvim-dap-python", ft = "python" },
	{
		"nvim-neotest/neotest",
		event = { "BufReadPost", "User FileOpened" },
	},
	{
		"nvim-neotest/neotest-python",
		event = { "BufEnter *.py" },
	},
	-- plugin for html autotag
	{ "windwp/nvim-ts-autotag", event = { "BufReadPre", "User FileOpened" } },
	-- nvim-surround plugin
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = { "BufReadPre", "User FileOpened" },
		config = function()
			require("nvim-surround").setup()
		end,
	},
	-- install mason tool automatically
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufReadPre", "User FileOpened" },
		config = function()
			require("user.mason-installer").setup()
		end,
	},
	-- preview typst
	{
		"chomosuke/typst-preview.nvim",
		-- lazy = false, -- or ft = 'typst'
		ft = "typst",
		version = "0.3.*",
		build = function()
			require("typst-preview").update()
		end,
	},
	-- lua debug adapter
	{
		"jbyuki/one-small-step-for-vimkind",
		ft = "lua",
	},
	-- emoji source for nvim-cmp
	{
		"hrsh7th/cmp-emoji",
		event = { "BufReadPre", "User FileOpened" },
	},
	-- calc source for nvim-cmp
	{
		"hrsh7th/cmp-calc",
		event = { "BufReadPre", "User FileOpened" },
	},
	-- rose pine color scheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
	-- new markdown rendering plugin
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		config = function()
			require("user.lsp.languages.markdown").setup()
		end,
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
	-- helper for js/ts lanaguage server: vtsls
	{
		"yioneko/nvim-vtsls",
		ft = { "javascript", "typescript" },
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		ft = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
	},
}
