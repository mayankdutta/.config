-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- local discipline = require('config.discipline')
-- discipline.Cowboy()

map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map({ "v", "n" }, "<leader>y", '"+y', { noremap = true, desc = "copying a line" })
map("n", "<leader>Y", "gg\"+yG''", { desc = "Copy whole file" })

-- map({ "i" }, "jj", "<Esc>", { silent = true })
-- map({ "i" }, "kj", "<Esc>", { silent = true })
-- map({ "i" }, "jk", "<Esc>", { silent = true })
-- map({ "i" }, "KJ", "<Esc>", { silent = true })
-- map({ "i" }, "JJ", "<Esc>", { silent = true })
-- map({ "i" }, "JK", "<Esc>", { silent = true })

vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

map({ "n", "v" }, "<S-h>", "^", { noremap = true, silent = true })
map({ "n", "v" }, "<S-l>", "$", { noremap = true, silent = true })

-- map("x", "<leader>p", [["_dP]], { desc = "" }) -- correct the yank. or just use P during visual mode.
-- map({ "n", "x" }, "<leader>p", [["0p]], { desc = "paste from yank register" }) -- kind of same as above.

map("n", "J", "mzJ`z", { desc = "" }) -- keep the cursor at the beginning while joining the line.

-- map(
--   { "n", "i", "v" },
--   "<C-d>",
--   require("telescope.actions").delete_buffer,
--   { noremap = true, silent = true, desc = "Deleting Buffer" }
-- )

vim.api.nvim_set_keymap("n", "<leader>bo", " :only<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", " :term<CR>", { noremap = true, silent = true })

map("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
map("n", "<leader>ce", ":EslintFixAll<CR>", { desc = "format stuff", noremap = true, silent = true })

map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

map("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })
