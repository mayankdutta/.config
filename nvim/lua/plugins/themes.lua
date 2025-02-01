
function AdjustColors()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
  
  return {
    {
      "rose-pine/neovim",
      as = "rose-pine",
      config = function()
        require("rose-pine").setup({
          -- disable_background = true,
          variant = "moon", -- auto, main, moon, or dawn
        })
        AdjustColors()
        vim.cmd("colorscheme rose-pine")
        -- vim.cmd("colorscheme catppuccin-mocha")
      end,
    },
  
    { "rebelot/kanagawa.nvim" },
    { "kdheepak/monochrome.nvim" },
    { "huyvohcmc/atlas.vim" },
    {
      "EdenEast/nightfox.nvim",
      -- config = function()
      --   vim.cmd("colorscheme catppuccin-frappe")
      -- end,
    },
    {
      "christoomey/vim-tmux-navigator",
      keys = {
        { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
        { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
        { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
        { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
        { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
      },
    },
    { "dasupradyumna/midnight.nvim" },
    { "tiagovla/tokyodark.nvim" },
    {
      "sainnhe/gruvbox-material",
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
  
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_enable_italic = true
        -- vim.g.gruvbox_material_better_performance = 1
  
        vim.g.gruvbox_material_enable_italic = 1
  
        -- vim.cmd.colorscheme("gruvbox-material")
        -- vim.cmd.colorscheme("kanagawa-lotus")
        -- vim.cmd.colorscheme("kanagawa-wave")
        -- vim.cmd.colorscheme("kanagawa-dragon")
        -- vim.cmd.colorscheme("vividchalk")
        -- vim.cmd.colorscheme("bamboo")
      end,
    },
    { "ellisonleao/gruvbox.nvim" },
  }
  
  -- vim.cmd("colorscheme rose-pine-main")
  -- vim.cmd("colorscheme rose-pine-moon")
  -- vim.cmd("colorscheme rose-pine-dawn")
  
  -- return {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.g.gruvbox_material_enable_italic = true
  --     -- vim.g.gruvbox_material_better_performance = 1
  --
  --     vim.g.gruvbox_material_enable_italic = 1
  --
  --     vim.cmd.colorscheme("gruvbox-material")
  --     -- vim.cmd.colorscheme("kanagawa-lotus")
  --     -- vim.cmd.colorscheme("kanagawa-wave")
  --     -- vim.cmd.colorscheme("kanagawa-dragon")
  --     -- vim.cmd.colorscheme("vividchalk")
  --     -- vim.cmd.colorscheme("bamboo")
  --   end,
  -- }
  