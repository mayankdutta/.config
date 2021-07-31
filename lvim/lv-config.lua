-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- keymappings
lvim.leader = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.keys.normal_mode = {
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ensure_installed = "maintained"

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Leader bindings for WhichKey



-- mine

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

lvim.builtin.which_key.mappings.t = { "<cmd>split term://fish | resize 28 <cr>", "Terminal" }
lvim.builtin.which_key.mappings.v = { "<cmd>vsplit<cr>", "vertical split" }
lvim.builtin.which_key.mappings.h = { "<cmd>split<cr>", "horizontal split" }
lvim.builtin.which_key.mappings.Y = { 'gg"+yG', "Copy whole file" }
lvim.builtin.which_key.mappings.y = { '"+y', "Copy Selected line" }

lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent.enable = false

vim.cmd [[
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  set autoindent
  set cindent
]]

lvim.plugins= {
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
}


