function AdjustColors()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
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
      -- vim.cmd("colorscheme monokai-pro-octagon")
      vim.cmd("colorscheme monokai-pro-default")
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
      -- vim.cmd.colorscheme("kanagawa-dragon")
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
