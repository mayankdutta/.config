-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )

-- /TODO disable save on format => <leader>uf
-- /TODO terminal issue.
-- /TODO comment issue.
-- /TODO surround issue.
-- /TODO telescope buffer delete stuff.

-- commenting

local map = vim.keymap.set

-- Resize window using <ctrl> arrow keys
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- vim.keymap.set(
--   "n",
--   "<C-d>",
--   require("telescope.actions").delete_buffer,
--   { noremap = true, silent = true, desc = "Deleting Buffer" }
-- )
