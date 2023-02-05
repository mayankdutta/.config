lvim.plugins = {
	{ "mfussenegger/nvim-jdtls" },
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		-- quickfix
		"kevinhwang91/nvim-bqf",
		lazy = true,
		ft = "qf",
		event = "QuickFixCmdPost",
		config = function()
			require("user.config.quickfix")
		end,
	},

	{
		"nvim-treesitter/playground",
		event = "BufRead",
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead" },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},

	{
		"filipdutescu/renamer.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		branch = "master",
		config = function()
			require("user.renamer").config()
		end,
	},

	{
		"LunarVim/Colorschemes",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{
		-- live editing of html/css
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		-- run = "npm install --prefix server",
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{ "catppuccin/nvim" },
	{ "gruvbox-community/gruvbox" },
	{ "chaoren/vim-wordmotion" },

	{ "mbbill/undotree", cmd = { "UndotreeToggle" }, lazy = true },
	-- { "godlygeek/tabular", cmd = { "tabular" } , lazy = true},
	{ "szw/vim-maximizer", cmd = { "MaximizerToggle" }, lazy = true },
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = "kkharji/sqlite.lua",
		lazy = true,
	},
	{
		"ThePrimeagen/harpoon",
		event = "VimEnter",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
		init = function()
			-- latipun7/dotfiles/blob/main/home/dot_config/exact_lvim/exact_lua/exact_latipun/exact_plugins/harpoon.lua
			-- require("config.harpoon").keybindings()
		end,
	},
	{
		"RRethy/nvim-treesitter-textsubjects",
		lazy = true,
	},
	{
		"wellle/targets.vim",
		lazy = true,
	},
}
