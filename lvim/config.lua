-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT



-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- keymappings
lvim.leader = "space"

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {"c", "cpp","css", "html", "javascript", "json", "lua", "regex", "ruby", "rust", "svelte", "scss", "tsx", "toml", "vue", "yaml", "typescript", "fish", "bash", "cmake", "jsdoc" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.lang.tailwindcss.active = true
lvim.lang.emmet.active = true

-- Whichkey
-- O.user_which_key = {
      -- t = { '<cmd>split term://fish | resize 28 <CR>', "split terminal"},
      -- v = { '<cmd>vsplit<CR>', 'vertical split'},
      -- h = { '<cmd>split<CR>', 'horizontal split'},
      -- y = { '"+y', 'copy selected line'},
      -- Y = { 'gg"+yG', 'copy whole file'},
      -- TODO add these
      -- p = {
      --   S = { "<cmd>PackerStatus<cr>", "Status" },
      --   C = { "<cmd>PackerClean<cr>", "Clean" },
      -- }
-- }

-- lvim.builtin.which_key.mappings.t = { "<cmd>split term://fish | resize 28 <cr>", "Terminal" }
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
lvim.builtin.terminal.open_mapping = "<leader>t"
lvim.builtin.terminal.direction="horizontal"
lvim.builtin.terminal.shading_factor = 3

vim.cmd [[
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  set autoindent
  set cindent
]]


lvim.plugins= {
    { "lunarvim/colorschemes" },
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
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
{ 'ms-jpq/coq_nvim', branch = 'coq'},
{ 'ms-jpq/coq.artifacts', branch= 'artifacts'},

}


