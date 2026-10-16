-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd("DirChanged", {
--   pattern = "*",
--   callback = function()
--     require("grapple").refresh()
--   end,
-- })

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end,
})

-- ==============================================================================
-- Macro recording indicator
-- ==============================================================================
--
-- The REC component lives in lua/plugins/myPlugins.lua (lualine_x). It reads
-- vim.fn.reg_recording(), but lualine only polls the statusline every 1000ms --
-- long enough that pressing `qq` appears to do nothing and you press `q` again.
-- These autocmds nudge lualine the moment recording starts and stops.
--
-- refresh() enqueues rather than redrawing inline; the queue drains on
-- lualine's refresh_time (16ms), so no `force` is needed.
--
-- Grouped with clear = true so re-sourcing this file replaces the handlers
-- instead of stacking duplicates.
local macro_recording = vim.api.nvim_create_augroup("macro_recording_statusline", { clear = true })

vim.api.nvim_create_autocmd("RecordingEnter", {
  group = macro_recording,
  callback = function()
    require("lualine").refresh({ place = { "statusline" } })
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  group = macro_recording,
  callback = function()
    -- RecordingLeave fires *before* the register is released: inside this
    -- callback reg_recording() still returns the register name, so refreshing
    -- here would leave REC stuck on screen. One event-loop tick is enough for
    -- it to read "" -- verified on 0.12.4, where vim.schedule already sees the
    -- cleared value. The 50ms uv timer commonly copied around is unnecessary.
    vim.schedule(function()
      require("lualine").refresh({ place = { "statusline" } })
    end)
  end,
})
