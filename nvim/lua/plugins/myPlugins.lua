return {
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      {
        "<CR>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    name = "harpoon",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      -- settings = {
      --   save_on_toggle = true,
      --   key = function()
      --     local git_branch  = vim.trim(vim.fn.system("git branch --show-current 2> /dev/null")) or ""
      --     local cwd = vim.fn.getcwd()
      --     return git_branch .. cwd
      --   end,
      -- },
    },

    keys = function()
      local keys = {
        {
          "<leader>a",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>H",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end

      for i = 1, 5 do
        table.insert(keys, {
          "<C-" .. i .. ">",
          function()
            require("harpoon"):list():replace_at(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "tpope/vim-repeat",
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = {
        "s1n7ax/nvim-window-picker",
        opts = function()
          require("window-picker").setup({

            hint = "floating-big-letter",
            show_prompt = false,

            filter_rules = {
              autoselect_one = false,
            },
          })
        end,
      },
    },
    {
      "nvimtools/none-ls.nvim",
      optional = true,
      opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = opts.sources or {}
        table.insert(opts.sources, nls.builtins.formatting.prettier)
      end,
    },
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>o", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
    },
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
  -- from example.lua

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "java",
        "lua",
        "markdown",
        "markdown_inline",
        "jsdoc",
        "luadoc",
        "c",
        "diff",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "css",
      },
      textobjects = { enabled = true },
      hightlight = { enable = true },
    },
  },
  { "ThePrimeagen/vim-be-good" },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        exclude = { -- add folder names here to exclude
          ".git",
          "node_modules",
        },
      },
    },
  },
}
