lvim.plugins= {
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
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  {"p00f/nvim-ts-rainbow"},
  {
    "filipdutescu/renamer.nvim",
    config = function()
      require("user.renamer").config()
    end,
    branch = "master",
  },
  -- {
  --   "tzachar/cmp-tabnine",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --     }
  --   end,

  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  -- },
  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("user.neoscroll").config()
  --   end,
  -- },
  -- {
  --   "abzcoding/zephyr-nvim",
  --   config = function()
  --     vim.cmd [[
  --     colorscheme zephyr
  --     ]]
  --   end,
  --   cond = function()
  --     local _time = os.date "*t"
  --     return (_time.hour >= 5 and _time.hour < 8)
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   as = "rose-pine",
  --   config = function()
  --     require("user.theme").rose_pine()
  --   end,
  --   cond = function()
  --     local _time = os.date "*t"
  --     return (_time.hour >= 8 and _time.hour < 11)
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require("user.theme").tokyonight()
  --     vim.cmd [[
  --     colorscheme tokyonight
  --     ]]
  --   end,
  --   cond = function()
  --     local _time = os.date "*t"
  --     return (_time.hour >= 0 and _time.hour < 5) or (_time.hour >= 11 and _time.hour < 17)
  --   end,
  -- },
  -- {
  --   "abzcoding/doom-one.nvim",
  --   branch = "feat/nvim-cmp-floating",
  --   config = function()
  --     require("user.theme").doom()
  --     vim.cmd [[
  --     colorscheme doom-one
  --     ]]
  --   end,
  --   -- cond = function()
  --   --   local _time = os.date "*t"
  --   --   return (_time.hour >= 17 and _time.hour < 21)
  --   -- end,
  -- },
  {
    "simrat39/symbols-outline.nvim",
    setup = function()
      require("user.symbols_outline").config()
    end,
    event = "BufReadPost",
    -- cmd = "SymbolsOutline",
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   setup = function()
  --     vim.g.indent_blankline_char = "▏"
  --   end,
  --   config = function()
  --     require("user.indent_blankline").config()
  --   end,
  --   event = "BufRead",
  -- },
  -- { "gelguy/wilder.nvim",
  -- config = function ()
  --   -- vim.cmd("source $HOME/.config/lvim/lua/user/wilder.vim")
  --   vim.cmd([[
  --   call wilder#setup({
  --     \ 'modes': [':', '/', '?'],
  --     \ 'next_key': '<Tab>',
  --     \ 'previous_key': '<S-Tab>',
  --     \ 'accept_key': '<Down>',
  --     \ 'reject_key': '<Up>',
  --     \ })
  --     ]])
  --   end
  -- },
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
  -- {
  --   'NTBBloodbath/doom-one.nvim',
  --   config = function()
  --     require('doom-one')
  --     require('doom-one').setup({
  --       cursor_coloring = false,
  --       terminal_colors = false,
  --       italic_comments = false,
  --       enable_treesitter = true,
  --       transparent_background = false,
  --       pumblend = {
  --         enable = true,
  --         transparency_amount = 20,
  --       },
  --       plugins_integrations = {
  --         neorg = true,
  --         barbar = true,
  --         bufferline = false,
  --         gitgutter = false,
  --         gitsigns = true,
  --         telescope = false,
  --         neogit = true,
  --         nvim_tree = true,
  --         dashboard = true,
  --         startify = true,
  --         whichkey = true,
  --         indent_blankline = true,
  --         vim_illuminate = true,
  --         lspsaga = false,
  --       },
  --     })
  --     vim.cmd [[
  --     colorscheme doom-one
  --     set background=dark
  --     ]]
  --   end,

  -- },


  { 
    "beauwilliams/focus.nvim", 
    config = function() 
      require("focus").setup() 
    end 
  }, 
}
