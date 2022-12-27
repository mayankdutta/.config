vim.g.mapleader = " "
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, desc = { "copy one line" } })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, desc = { "copy one line" } })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z") -- keep the cursor at the beginning while joining the line.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- keep the cursor at the middle of the screen while moving half page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz") 
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.cmd [[ au BufEnter * if &buftype == 'terminal' | :startinsert | endif ]]

