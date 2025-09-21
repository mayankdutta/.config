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
    "nvim-mini/mini.surround",
    recommended = true,
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local opts = LazyVim.opts("mini.surround")
      local mappings = {
        { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete Surrounding" },
        { opts.mappings.find, desc = "Find Right Surrounding" },
        { opts.mappings.find_left, desc = "Find Left Surrounding" },
        { opts.mappings.highlight, desc = "Highlight Surrounding" },
        { opts.mappings.replace, desc = "Replace Surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
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
        "go",
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
        "dockerfile", -- Dockerfiles
        "docker", -- Docker syntax highlighting
        "zsh",
      },
      textobjects = { enabled = true },
      hightlight = { enable = true },
      rainbow = { enable = true }, -- Optional: Enable rainbow parentheses (for better readability)
    },
  },
  { "ThePrimeagen/vim-be-good" },
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      local WorkTree = require("git-worktree")
      local fzf = require("fzf-lua")

      WorkTree.setup({})

      local function pick_or_create_worktree()
        -- Get existing worktrees
        local output = vim.fn.systemlist("git worktree list")
        if vim.v.shell_error ~= 0 then
          print("Not a git repository")
          return
        end

        local choices = { "[+] Create new worktree" }
        vim.list_extend(choices, output)

        fzf.fzf_exec(choices, {
          prompt = "Worktrees > ",
          actions = {
            ["default"] = function(selected)
              if not selected or #selected == 0 then
                return
              end

              local choice = selected[1]

              -- Case 1: Create new
              if choice:match("^%[%+%] Create new worktree") then
                local path = vim.fn.input("New worktree path: ")
                if path == "" then
                  print("Cancelled")
                  return
                end
                local branch = vim.fn.input("Branch name: ")
                if branch == "" then
                  print("Cancelled")
                  return
                end
                local upstream = vim.fn.input("Upstream (optional): ")
                if upstream == "" then
                  upstream = nil
                end

                WorkTree.create_worktree(path, branch, upstream)
                return
              end

              -- Case 2: Switch existing
              local chosen_path = vim.split(choice, " ")[1] -- first column is path
              if chosen_path and chosen_path ~= "" then
                WorkTree.switch_worktree(chosen_path)
              end
            end,
          },
        })
      end

      -- Map it (example: <leader>gw)
      vim.keymap.set("n", "<leader>gw", pick_or_create_worktree, { desc = "Switch/Create Git Worktree (fzf)" })
    end,
  },

  -- {
  --   "ThePrimeagen/git-worktree.nvim",
  --   opts = function()
  --     local WorkTree = require("git-worktree")
  --     local fzf = require("fzf-lua")
  --     WorkTree.get_worktrees(function(worktrees)
  --       if not worktrees or #worktrees == 0 then
  --         print("No git worktrees found")
  --         return
  --       end
  --
  --       local choices = {}
  --       for _, worktree in ipairs(worktrees) do
  --         table.insert(choices, {
  --           name = worktree.path,
  --           value = worktree.path,
  --         })
  --       end
  --
  --       fzf.fzf_exec(choices, {
  --         prompt = "Select a worktree: ",
  --         on_select = function(selected)
  --           WorkTree.switch_to_worktree(selected.value)
  --         end,
  --       })
  --     end)
  --   end,
  -- },
  -- {
  --   "mason-org/mason.nvim",
  --   opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
  -- },
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
