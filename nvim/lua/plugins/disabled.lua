return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "nvimdev/dashboard-nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      scratch = { enabled = false },
      terminal = { enabled = false },
      scroll = { enabled = false },
      animate = { enabled = false },
      indent = { enabled = false },
      notifier = { enabled = false },
      picker = {
        enabled = true,
        exclude = { ".git", "node_modules", "dist", ".next" },
        layout = {
          hidden = { "preview" }, -- hide preview by default
          -- preset = "ivy_split", -- or "vscode", "dropdown", "vertical", etc.
        },
        win = {
          input = {
            keys = {
              ["<c-o>"] = { "toggle_preview", mode = { "i", "n" } },
            },
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
      },
    },
  },
}
