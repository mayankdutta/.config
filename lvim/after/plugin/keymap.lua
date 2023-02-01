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

-- map({ "n", "v" }, "gh", "^")

-- gl is already mapped to line diagnostics
-- map("n", "gl", "$")
-- map("v", "gl", "g_")

-- keep the cursor at the middle of the screen while moving half page up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

vim.cmd [[ au BufEnter * if &buftype == 'terminal' | :startinsert | endif ]]

lvim.builtin.which_key.mappings.v = { "<cmd>vsplit<cr>", "vertical split" }
lvim.builtin.which_key.mappings.h = { "<cmd>split<cr>", "horizontal split" }
lvim.builtin.which_key.mappings.n = { "<cmd>noh<cr>", "No highlighting" }
lvim.builtin.which_key.mappings.Y = { "gg\"+yG''", "Copy whole file" }

lvim.builtin.which_key.mappings["m"] = {
	name = "+MarkdownPreview",
	p = { "<cmd>MarkdownPreview<cr>", "Markdown preview " },
	s = { "<cmd>MarkdownPreviewStop<cr>", "Makrdown preview stop" },
	t = { "<cmd>MarkdownPreviewToggle<cr>", "Makrdown preview Toggle" },
}

lvim.builtin.which_key.mappings.b.a = { "<cmd>only<cr>", "Close all splits except currently on focus" }

lvim.builtin.terminal.open_mapping = "<C-t>"

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.shading_factor = 3
