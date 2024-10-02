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

map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map({ "v", "n" }, "<leader>y", '"+y', { noremap = true, desc = "copying a line" })
map("n", "<leader>Y", "gg\"+yG''", { desc = "Copy whole file" })

map({ "i" }, "jj", "<Esc>", { silent = true })
map({ "i" }, "jk", "<Esc>", { silent = true })
map({ "i" }, "kj", "<Esc>", { silent = true })
map({ "i" }, "JJ", "<Esc>", { silent = true })
map({ "i" }, "JK", "<Esc>", { silent = true })
map({ "i" }, "KJ", "<Esc>", { silent = true })

map("n", "<S-h>", "^", { noremap = true, silent = true })
map("n", "<S-l>", "$", { noremap = true, silent = true })

map("n", "J", "mzJ`z", { desc = "" })

vim.api.nvim_set_keymap("n", "<leader>bo", ":only<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-t>", ":term<CR>", {noremap = true, silent = true})

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end)
vim.keymap.set("n", "<leader>H", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

harpoon:extend({
    UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
    end,
})

map("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
map("n", "<leader>ce", ":EslintFixAll<CR>", { noremap = true, silent = true })


-- map(
--   { "n", "i", "v" },
--   "<C-d>",
--   require("telescope.actions").delete_buffer,
--   { noremap = true, silent = true, desc = "Deleting Buffer" }
-- )

map('n', '+', '<C-a>')
map('n', '-', '<C-x>')