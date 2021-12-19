-- general

require "user.plugins"
require "user.bufferline"

require("luasnip/loaders/from_vscode").load { paths = { "./snippets/" } }


lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "darkplus"

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

lvim.builtin.cmp.experimental.ghost_text = false
lvim.builtin.telescope.defaults.path_display = { "smart" }
lvim.builtin.project.patterns = { ".git" }
lvim.builtin.project.detection_methods = { "pattern" }
lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline
-- lvim.builtin.lualine.options.theme = ""

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
-- lvim.builtin.which_key.mappings.y = { '"+y', "Copy Selected line" }
lvim.builtin.which_key.mappings.n = { "<cmd>noh<cr>", "No hightlighting" }

lvim.builtin.which_key.mappings["m"] = {
  name = "+MarkdownPreview",
  p = { "<cmd>MarkdownPreview<cr>", "Markdown preview " },
  s = { "<cmd>MarkdownPreviewStop<cr>", "Makrdown preview stop" },
  t = { "<cmd>MarkdownPreviewToggle<cr>", "Makrdown preview Toogle" },
}

lvim.builtin.which_key.mappings.b.v = { "<cmd>only<cr>", "Close all splits except currently on focus" }

lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent.enable = false

lvim.builtin.treesitter.rainbow = {
  enable = true,
  colors = {
    "Gold",
    "Orchid",
    "DodgerBlue",
    -- "Cornsilk",
    -- "Salmon",
    -- "LawnGreen",
  },
  disable = { "html" },
}

vim.opt.clipboard = ""
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction="horizontal"
lvim.builtin.terminal.shading_factor = 3
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" }



vim.cmd [[
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
vnoremap <space>y "+y

]]

-- removing the filetypes argument will allow the formatter to attach to all the default filetypes it supports.


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  {
    exe = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "black" },
  {
    exe = "eslint_d",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
}

