require "user.keymap"
require "user.set"
require "user.plugins"
require "user.bufferline"
require "user.ignore_pattern"
require "user.telescope"

lvim.colorscheme = "darkplus"

lvim.log.level = "warn"
lvim.format_on_save = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.lsp.installer.automatic_servers_installation = true

lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true

lvim.builtin.terminal.shell = "/bin/zsh"

lvim.builtin.cmp.experimental.ghost_text = false
lvim.builtin.telescope.defaults.path_display = { "smart" }

lvim.builtin.project.active = true;
lvim.builtin.project.patterns = { ".git" }
lvim.builtin.project.detection_methods = { "pattern", "lsp" }

lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline

lvim.builtin.which_key.mappings.v = { "<cmd>vsplit<cr>", "vertical split" }
lvim.builtin.which_key.mappings.h = { "<cmd>split<cr>", "horizontal split" }
lvim.builtin.which_key.mappings.n = { "<cmd>noh<cr>", "No highlighting" }
lvim.builtin.which_key.mappings.Y = { 'gg"+yG\'\'', "Copy whole file" }

lvim.builtin.which_key.mappings["m"] = {
  name = "+MarkdownPreview",
  p = { "<cmd>MarkdownPreview<cr>", "Markdown preview " },
  s = { "<cmd>MarkdownPreviewStop<cr>", "Makrdown preview stop" },
  t = { "<cmd>MarkdownPreviewToggle<cr>", "Makrdown preview Toggle" },
}

lvim.builtin.which_key.mappings.b.v = { "<cmd>only<cr>", "Close all splits except currently on focus" }

lvim.builtin.nvimtree.setup.view.side = "left"

lvim.lsp.diagnostics.virtual_text = false;

lvim.builtin.treesitter.indent.disable = { "python" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent.enable = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "scss",
  "cpp",
  "bash",
  "dot",
  "fish",
  "go",
  "graphql",
  "html",
  "json5",
  "latex",
  "lua",
  "tsx",
  "vim", 
  "jsdoc",
  "markdown",
  "markdown_inline",
  "sql", 
}

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



lvim.builtin.telescope.active = true
lvim.builtin.autopairs.active = true

vim.opt.relativenumber = true

lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.shading_factor = 3

-- removing the filetypes argument will allow the formatter to attach to all the default filetypes it supports.

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { exe = "black" },
  {
    exe = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
}

-- set additional linters

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "javascript", "python" , "lua", "cpp", "c", "java"},
  },
}


local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    command = "eslint_d"
  },
  {
    name = "proselint"
  },
}
