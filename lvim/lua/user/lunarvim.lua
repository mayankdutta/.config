lvim.log.level = "info"
lvim.log.async = false
lvim.log.override_notify = false

lvim.colorscheme = "gruvbox"
lvim.transparent_window = true

lvim.log.level = "warn"

lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.lsp.installer.automatic_servers_installation = true

lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.shell = "/bin/zsh"

lvim.builtin.cmp.experimental.ghost_text = false
lvim.builtin.telescope.defaults.path_display = { "smart" }

lvim.builtin.project.active = true
lvim.builtin.project.patterns = { ".git" }
lvim.builtin.project.detection_methods = { "pattern", "lsp" }

lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline

lvim.builtin.nvimtree.setup.view.side = "left"

-- causing prettier to not attach with current buffer.
-- vim.diagnostics.config = { virtual_text = false }

lvim.builtin.treesitter.indent.disable = { "python" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent.enable = false
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.textsubjects = {
  enable = true,
  keymaps = {
    ["."] = "textsubjects-smart",
    [";"] = "textsubjects-container-outer",
  },
}

lvim.builtin.treesitter.textobjects.select = {
  enable = true,

  -- Automatically jump forward to textobj, similar to targets.vim
  lookahead = true,

  keymaps = {
    -- You can use the capture groups defined in textobjects.scm
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },

  lsp_interop = {
    enable = true,
    border = "none",
    peek_definition_code = {
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
}

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

lvim.builtin.telescope.active = true
lvim.builtin.autopairs.active = true

vim.opt.relativenumber = true

-- lvim.use_icons = false

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua" },
  {
    exe = "prettier",
  },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
})

local code_actions = require("lvim.lsp.null-ls.code_actions");
code_actions.setup({
  {
    name = "proselint",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
