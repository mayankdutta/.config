-- Remap leader and local leader to <Space>
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.maplocalleader = " "

vim.opt.updatetime = 250 --Decrease update time
vim.opt.signcolumn = "yes" -- Always show sign column

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.timeoutlen = 300

vim.opt.clipboard = ""
vim.opt.relativenumber = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.smartcase = true
vim.opt.updatetime = 50

vim.o.completeopt = 'menuone,noselect'
