-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local map = vim.keymap.set

require("telescope").setup({
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_mru = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
      },
    },
  },
})
-- vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter term://*" }, { command = "startinsert" })

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end,
})

vim.opt.winbar = "%=%m %f"
vim.opt.clipboard = ""

vim.opt.timeoutlen = 50
vim.opt.updatetime = 50

vim.g.autoformat = false
vim.go.background = "dark"
vim.opt.sessionoptions = "curdir"

vim.opt.cursorline = false

-- local harpoon = require("harpoon")
--
-- map("n", "<leader>a", function() harpoon:list():add() end)
--
-- map("n", "<leader>H>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- map("n", ",a", function() harpoon:list():select(1) end)
-- map("n", ",b", function() harpoon:list():select(2) end)
-- map("n", ",c", function() harpoon:list():select(3) end)
-- map("n", ",d", function() harpoon:list():select(4) end)
--
-- map("n", ";a", function() harpoon:list():replace_at(1) end)
-- map("n", ";b", function() harpoon:list():replace_at(2) end)
-- map("n", ";c", function() harpoon:list():replace_at(3) end)
-- map("n", ";d", function() harpoon:list():replace_at(4) end)

