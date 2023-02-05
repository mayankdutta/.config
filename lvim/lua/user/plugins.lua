lvim.plugins = {
	{ "mfussenegger/nvim-jdtls" },
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	-- {
	-- 	"kevinhwang91/nvim-bqf",
	-- 	event = { "BufRead", "BufNew" },
	-- 	config = function()
	-- 		require("bqf").setup({
	-- 			auto_enable = true,
	-- 			preview = {
	-- 				win_height = 12,
	-- 				win_vheight = 12,
	-- 				delay_syntax = 80,
	-- 				border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
	-- 			},
	-- 			func_map = {
	-- 				vsplit = "",
	-- 				ptogglemode = "z,",
	-- 				stoggleup = "",
	-- 			},
	-- 			filter = {
	-- 				fzf = {
	-- 					action_for = { ["ctrl-s"] = "split" },
	-- 					extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"nvim-treesitter/playground",
		event = "BufRead",
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},

	{
		"filipdutescu/renamer.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
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
		run = "npm install --prefix server",
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

	{
		"sainnhe/everforest",
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},
	{ "mbbill/undotree", cmd = { "UndotreeToggle" } },
	-- { "godlygeek/tabular", cmd = { "tabular" } },
	{ "szw/vim-maximizer", cmd = { "MaximizerToggle" } },
}
