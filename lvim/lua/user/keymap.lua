vim.g.mapleader = " "
local map = vim.keymap.set


map("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

map("v", "<leader>y", '"+y', { noremap = true, desc = { "copy one line" } })
map("n", "<leader>y", '"+y', { noremap = true, desc = { "copy one line" } })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z") -- keep the cursor at the beginning while joining the line.
map("x", "<leader>p", [["_dP]])

map("n", "<C-h>", "<S-^>");
map("n", "<C-l>", "<S-$>");

-- keep the cursor at the middle of the screen while moving half page up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

vim.cmd [[ au BufEnter * if &buftype == 'terminal' | :startinsert | endif ]]
