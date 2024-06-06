vim.g.mapleader = " "
-- local map = vim.keymap.set
local map = vim.api.nvim_set_keymap

map("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

map("v", "<leader>y", '"+y', { noremap = true, desc = { "copy one line" } })
map("n", "<leader>y", '"+y', { noremap = true, desc = { "copy one line" } })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "" })
map("n", "J", "mzJ`z", { desc = "" }) -- keep the cursor at the beginning while joining the line.
map("x", "<leader>p", [["_dP]], { desc = "" })

-- map({ "n", "v" }, "gh", "^")

-- gl is already mapped to line diagnostics
-- map("n", "gl", "$")
-- map("v", "gl", "g_")

-- keep the cursor at the middle of the screen while moving half page up/down

map("i", "jk", "<ESC>", { desc = "" })
map("i", "jj", "<ESC>", { desc = "" })

map("n", "<C-d>", "<C-d>zz", { desc = "" })
map("n", "<C-u>", "<C-u>zz", { desc = "" })
map("n", "n", "nzzzv", { desc = "" })
map("n", "N", "Nzzzv", { desc = "" })

map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "vertical split" })
map("n", "<leader>h", "<cmd>split<cr>", { desc = "horizontal split" })
map("n", "<leader>n", "<cmd>noh<cr>", { desc = "No highlighting" })
map("n", "<leader>Y", "gg\"+yG''", { desc = "Copy whole file" })
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "undo tree" })
map("n", "<leader>f", "<cmd>MaximizerToggle<cr>", { desc = "full focus " })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "full focus " })

map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>lf", "<cmd>lua require('lvim.lsp.utils').format()<cr>", { desc = "Format" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
map("n", "<leader>lI", "<cmd>Mason<cr>", { desc = "Mason Info" })
map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quickfix" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })
map("n", "<leader>le", "<cmd>Telescope quickfix<cr>", { desc = "Telescope Quickfix" })

-- might be causing issue.
-- vim.cmd([[ au BufEnter * if &buftype == 'terminal' | :startinsert | endif ]])

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
