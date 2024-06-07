require "nvchad.mappings"

-- add yours here




local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

map("v", "<leader>y", '"+y', { noremap = true })
map("n", "<leader>y", '"+y', { noremap = true })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z") -- keep the cursor at the beginning while joining the line.
map("x", "<leader>p", [["_dP]])

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "vertical split" })
map("n", "<leader>h", "<cmd>split<cr>", { desc = "horizontal split" })
map("n", "<leader>n", "<cmd>noh<cr>", { desc = "No highlighting" })
map("n", "<leader>Y", "gg\"+yG''", { desc = "Copy whole file" })
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "undo tree" })
-- map("n", "<leader>f", "<cmd>MaximizerToggle<cr>", {desc = "full focus "} )
map("n", "<leader>q", "<cmd>q<cr>", { desc = "quit window" })

map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })

map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })

map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
map("n", "<leader>lI", "<cmd>Mason<cr>", { desc = "Mason Info" })
map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quickfix" })


map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })
map("n", "<leader>le", "<cmd>Telescope quickfix<cr>", { desc = "Telescope Quickfix" })


-- nvim tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })


-- new terminals

map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map("n", "<S-h>", "<ESC>^", { desc = "move beginning of line" })
map("n", "<S-l>", "$", { desc = "move end of line" })


-- telescope
map("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- map("n", "<leader>fa", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })

map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- close buffer
-- map("n", "<leader>c", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })


-- Terminal window navigation
map('x', "<C-h>", "<C-\\><C-N><C-w>h");
map('x', "<C-j>", "<C-\\><C-N><C-w>j");
map('x', "<C-k>", "<C-\\><C-N><C-w>k");
map('x', "<C-l>", "<C-\\><C-N><C-w>l");




-- Resize with arrows
map('n', '<C-Up>', ":resize -2<CR>");
map('n', '<C-Down>', ":resize +2<CR>");
map('n', '<C-Left>', ":vertical resize -2<CR>");
map('n', '<C-Right>', ":vertical resize +2<CR>");


-- renamer
-- -- decided to kept default.






-- lvim.builtin.which_key.mappings.t = { '<cmd>tabular<cr>=expand() ."/"', "Vim tabular" }

-- lvim.builtin.which_key.mappings["m"] = {
-- 	name = "+MarkdownPreview",
-- 	p = { "<cmd>MarkdownPreview<cr>", "Markdown preview " },
-- 	s = { "<cmd>MarkdownPreviewStop<cr>", "Makrdown preview stop" },
-- 	t = { "<cmd>MarkdownPreviewToggle<cr>", "Makrdown preview Toggle" },
-- }

-- lvim.builtin.which_key.mappings.b.a = { "<cmd>only<cr>", "Close all splits except currently on focus" }
--
-- lvim.builtin.which_key.mappings["j"] = {
-- 	name = "Jump",
-- 	a = { "<Cmd>lua require('harpoon.mark').add_file()<Cr>", "Add" },
-- 	m = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>", "Menu" },
-- }
--
-- lvim.builtin.which_key.mappings["1"] = { "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>", "Jump 1" }
-- lvim.builtin.which_key.mappings["2"] = { "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>", "Jump 2" }
-- lvim.builtin.which_key.mappings["3"] = { "<Cmd>lua require('harpoon.ui').nav_file(3) <Cr>", "Jump 3" }
-- lvim.builtin.which_key.mappings["4"] = { "<Cmd>lua require('harpoon.term').gotoTerminal(1)<Cr>", "Terminal" }
--
-- lvim.builtin.terminal.open_mapping = "<C-t>"
--
-- lvim.builtin.terminal.direction = "horizontal"
-- lvim.builtin.terminal.shading_factor = 3

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
