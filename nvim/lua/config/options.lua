-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

require('telescope').setup({
  pickers = {
      buffers = {
        show_all_buffers = true, 
        sort_mru = true, 
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer", 
          }, 
        }, 
      },
    },
  })

vim.api.nvim_create_autocmd({"TermOpen", "BufEnter" }, {
    pattern = { "*" }, 
    callback = function()
      if vim.opt.buftype:get() == "terminal" then 
        vim.cmd(":startinsert")
      end
    })

vim.opt.winbar = "%=%m %f"
vim.opt.clipboard = ""
vim.b.autoformat = false
