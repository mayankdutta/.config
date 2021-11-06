-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "fish",
  "javascript",
  "json",
  "lua",
  "regex",
  "scss",
  "tsx",
  "python",
  "typescript",
  "css",
  "rust",
  "vim",
  "yaml",
  "java",
  "yaml"
}
lvim.builtin.treesitter.indent.disable = { "python" }


lvim.builtin.telescope.active=true
lvim.builtin.autopairs.active = true


-- lvim.lang.tailwindcss.lsp.active = true
lvim.lang.emmet.active = true



lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.which_key.mappings.v = { "<cmd>vsplit<cr>", "vertical split" }
lvim.builtin.which_key.mappings.h = { "<cmd>split<cr>", "horizontal split" }
lvim.builtin.which_key.mappings.Y = { 'gg"+yG', "Copy whole file" }
lvim.builtin.which_key.mappings.y = { '"+y', "Copy Selected line" }
lvim.builtin.which_key.mappings.n = { "<cmd>:noh<cr>", "No hightlighting" }

lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent.enable = false

vim.opt.clipboard = ""
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction="horizontal"
lvim.builtin.terminal.shading_factor = 3



vim.cmd [[
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
]]

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
}


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  {
    exe = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "black" },
  {
    exe = "eslint_d",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}
