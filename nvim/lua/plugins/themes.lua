function AdjustColors()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  -- {
  --   "p00f/alabaster.nvim",
  -- },
  {
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup() -- (see Configuration below for all customization options)
      -- vim.cmd.colorscheme("oasis-lagoon") -- After setup, apply theme (or any style like "oasis-night")
    end,
  },
  { "loctvl842/monokai-pro.nvim" },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup({
        -- disable_background = true,
        variant = "moon", -- auto, main, moon, or dawn
      })
      -- AdjustColors()
      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme nightfox")
      -- vim.cmd("colorscheme catppuccin-mocha")
      -- vim.cmd("colorscheme catppuccin-frappe")
      -- vim.cmd("colorscheme catppuccin-latte")
      -- vim.cmd("colorscheme monokai-pro-octagon")
      -- vim.cmd("colorscheme monokai-pro-default")
      -- vim.cmd("colorscheme everforest")
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        -- Your config here
      })
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

      -- vim.cmd.colorscheme("kanagawa-lotus")
      -- vim.cmd.colorscheme("kanagawa-wave")
      -- vim.cmd.colorscheme("vividchalk")
      -- vim.cmd.colorscheme("bamboo")
    end,
  },
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
