lvim.plugins = {
  { "mfussenegger/nvim-jdtls" },
  {
    "unblevable/quick-scope",
    config = function()
      vim.cmd [[
      let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
      ]]
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
    },
    { "p00f/nvim-ts-rainbow" },
    {
      "filipdutescu/renamer.nvim",
      config = function()
        require("user.renamer").config()
      end,
      branch = "master",
    },
    {
      "simrat39/symbols-outline.nvim",
      setup = function()
        require("user.symbols_outline").config()
      end,
      event = "BufReadPost",
      cmd = "SymbolsOutline",
    },
    {
      "Nguyen-Hoang-Nam/nvim-mini-file-icons",
      config = function()
        require("nvim-web-devicons").set_icon {
          rs = {
            icon = "",
            color = "#d28445",
            name = "Rust",
          },
        }
      end,
      disable = lvim.builtin.nvim_web_devicons == nil,
    },
    {
      "LunarVim/Colorschemes"
    },
    -- automatic resizing
    -- {
    --   "beauwilliams/focus.nvim",
    --   config = function()
    --     require("focus").setup()
    --   end
    -- },
    -- {
    --   "ur4ltz/surround.nvim",
    --   config = function()
    --     require "surround".setup { mappings_style = "surround" }
    --   end
    -- },
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
      setup = function()
        vim.cmd [[packadd telescope.nvim]]
      end,
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
        require "lsp_signature".setup()
      end
    },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    {
      "turbio/bracey.vim",
      cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
      run = "npm install --prefix server",
    },
  }
}
