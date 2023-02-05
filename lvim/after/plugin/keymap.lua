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

vim.cmd([[ au BufEnter * if &buftype == 'terminal' | :startinsert | endif ]])

lvim.builtin.which_key.mappings.v = { "<cmd>vsplit<cr>", "vertical split" }
lvim.builtin.which_key.mappings.h = { "<cmd>split<cr>", "horizontal split" }
lvim.builtin.which_key.mappings.n = { "<cmd>noh<cr>", "No highlighting" }
lvim.builtin.which_key.mappings.Y = { "gg\"+yG''", "Copy whole file" }
lvim.builtin.which_key.mappings.u = { "<cmd>UndotreeToggle<cr>", "undo tree" }
lvim.builtin.which_key.mappings.f = { "<cmd>MaximizerToggle<cr>", "full focus " }
-- lvim.builtin.which_key.mappings.t = { '<cmd>tabular<cr>=expand() ."/"', "Vim tabular" }

lvim.builtin.which_key.mappings["m"] = {
	name = "+MarkdownPreview",
	p = { "<cmd>MarkdownPreview<cr>", "Markdown preview " },
	s = { "<cmd>MarkdownPreviewStop<cr>", "Makrdown preview stop" },
	t = { "<cmd>MarkdownPreviewToggle<cr>", "Makrdown preview Toggle" },
}

lvim.builtin.which_key.mappings.b.a = { "<cmd>only<cr>", "Close all splits except currently on focus" }

lvim.builtin.which_key.mappings["j"] = {
	name = "Jump",
	a = { "<Cmd>lua require('harpoon.mark').add_file()<Cr>", "Add" },
	m = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>", "Menu" },
}

lvim.builtin.which_key.mappings["1"] = { "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>", "Jump 1" }
lvim.builtin.which_key.mappings["2"] = { "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>", "Jump 2" }
lvim.builtin.which_key.mappings["3"] = { "<Cmd>lua require('harpoon.ui').nav_file(3) <Cr>", "Jump 3" }
lvim.builtin.which_key.mappings["4"] = { "<Cmd>lua require('harpoon.term').gotoTerminal(1)<Cr>", "Terminal" }

lvim.builtin.terminal.open_mapping = "<C-t>"

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.shading_factor = 3
