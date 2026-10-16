function AdjustColors()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  -- Active theme: kanagawa-dragon. Other colorschemes are commented out
  -- to avoid installing/loading plugins that are never used.
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  { "oneslash/helix-nvim", version = "*" },

  -- {
  --   "uhs-robert/oasis.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("oasis").setup()
  --     -- vim.cmd.colorscheme("oasis-lagoon")
  --   end,
  -- },
  -- { "loctvl842/monokai-pro.nvim" },
  -- {
  --   "rose-pine/neovim",
  --   as = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       -- disable_background = true,
  --       variant = "moon", -- auto, main, moon, or dawn
  --     })
  --     -- AdjustColors()
  --     -- vim.cmd("colorscheme rose-pine")
  --     -- vim.cmd("colorscheme nightfox")
  --     -- vim.cmd("colorscheme catppuccin-mocha")
  --     -- vim.cmd("colorscheme catppuccin-frappe")
  --     -- vim.cmd("colorscheme catppuccin-latte")
  --     -- vim.cmd("colorscheme monokai-pro-octagon")
  --     -- vim.cmd("colorscheme monokai-pro-default")
  --     -- vim.cmd("colorscheme everforest")
  --   end,
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("everforest").setup({})
  --   end,
  -- },
  -- { "kdheepak/monochrome.nvim" },
  -- { "huyvohcmc/atlas.vim" },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   -- config = function()
  --   --   vim.cmd("colorscheme catppuccin-frappe")
  --   -- end,
  -- },
  -- { "dasupradyumna/midnight.nvim" },
  -- { "tiagovla/tokyodark.nvim" },
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.g.gruvbox_material_enable_italic = true
  --     -- vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_enable_italic = 1
  --     -- vim.cmd.colorscheme("kanagawa-lotus")
  --     -- vim.cmd.colorscheme("kanagawa-wave")
  --     -- vim.cmd.colorscheme("vividchalk")
  --     -- vim.cmd.colorscheme("bamboo")
  --   end,
  -- },
}

-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
