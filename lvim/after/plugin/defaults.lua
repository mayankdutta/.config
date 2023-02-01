local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.maplocalleader = " "

opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column

-- Time in milliseconds to wait for a mapped sequence to complete.
opt.timeoutlen = 300

