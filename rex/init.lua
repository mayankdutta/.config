-- ==============================================================================
-- Rex key bindings: tmux-style flow
-- ==============================================================================
-- Prefix is Ctrl+Space, same as ~/.config/tmux/tmux.conf, so tmux muscle memory
-- carries over. Every prefix binding starts a key sequence; Esc cancels one
-- that is half typed. Rex's own Cmd defaults (Cmd+K sessions, Cmd+P go to
-- anything, Cmd+T, Cmd+D...) are left alone because one chord beats two.
local P = "ctrl+space>"

-- Press the prefix twice to send one Ctrl+Space to the program (tmux send-prefix).
rex.bind(P .. "ctrl+space", "pane.send_key", { key = "ctrl+space" })

-- ------------------------------------------------------------------------------
-- Tabs (tmux "windows")
-- ------------------------------------------------------------------------------
rex.bind(P .. "c", "client.tab.new")
rex.bind(P .. "n", "client.tab.next")
rex.bind(P .. "p", "client.tab.previous")
rex.bind(P .. "shift+7", "client.tab.close")          -- &
rex.bind(P .. "shift+,", "client.tab.move.backward")  -- <
rex.bind(P .. "shift+.", "client.tab.move.forward")   -- >
-- Rex numbers tabs from 1, matching tmux's `base-index 1`.
for i = 1, 9 do
  rex.bind(P .. i, "client.tab.goto", { index = i })
end

-- ------------------------------------------------------------------------------
-- Renaming: r = tab, R = session (tmux's , and $ kept as aliases)
-- ------------------------------------------------------------------------------
rex.bind(P .. "r", "client.tab.rename")
rex.bind(P .. "shift+r", "session.rename")
rex.bind(P .. ",", "client.tab.rename")
rex.bind(P .. "shift+4", "session.rename")  -- $

-- ------------------------------------------------------------------------------
-- Splits: v = side by side, - = top/bottom (tmux's % and " kept too)
-- ------------------------------------------------------------------------------
rex.bind(P .. "v", "pane.split.right")
rex.bind(P .. "-", "pane.split.down")
rex.bind(P .. "shift+5", "pane.split.right")  -- %
rex.bind(P .. "shift+'", "pane.split.down")   -- "

-- ------------------------------------------------------------------------------
-- Panes
-- ------------------------------------------------------------------------------
-- Prefix + hjkl always moves focus, even inside vim (fallback for smart Ctrl+hjkl).
rex.bind(P .. "h", "pane.focus.left")
rex.bind(P .. "j", "pane.focus.down")
rex.bind(P .. "k", "pane.focus.up")
rex.bind(P .. "l", "pane.focus.right")
-- pane.focus_previous is "previous in order", not tmux's "last active pane".
rex.bind(P .. "o", "pane.focus_next")
rex.bind(P .. ";", "pane.focus_previous")
rex.bind(P .. "z", "pane.zoom")
rex.bind(P .. "x", "pane.close")
rex.bind(P .. "shift+b", "pane.move_to_new_tab")  -- tmux break-pane
-- tmux join-pane joined the marked pane; Rex opens a picker of tabs instead.
rex.bind(P .. "shift+j", "pane.move_to_tab")

-- ------------------------------------------------------------------------------
-- Sessions, finding, config
-- ------------------------------------------------------------------------------
rex.bind(P .. "w", "pane.go_to")

-- fzf pickers (~/.config/rex/*.sh) run in a temporary bottom split. Switching
-- sessions from them needs Remote Control on (Settings > Server), since the
-- request comes from the script, not the app.
-- The full rex path goes through the "Current" link, so it survives updates.
local HOME = os.getenv("HOME")
local REX = HOME .. "/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS/rex"

local function picker_action(name, title, script)
  rex.action{
    name  = name,
    title = title,
    run   = function(ctx)
      -- `rex run` returns as soon as the split exists, so the action finishes
      -- well inside Rex's 30 s limit while fzf waits for you.
      -- The action runs inside the server, which has no "current" session, so
      -- anchor the split on the session and pane the key was pressed in.
      local r, err = rex.exec({ REX, "run",
                                "-s", ctx.session_id, "-b", ctx.block_id,
                                "--split=below", "--ratio", "40", "--",
                                HOME .. "/.config/rex/" .. script })
      -- Surface failures instead of silently doing nothing.
      if err ~= nil then error(err, 0) end
      if not r.ok then error("rex run failed: " .. r.stderr, 0) end
      return r
    end,
  }
end

-- Sessionizer (port of ~/.config/tmux/tmux-sessionizer.sh): fzf over project
-- folders, then jump to the session labelled after the folder, creating it
-- first if needed.
picker_action("sessionizer", "Sessionizer", "rex-sessionizer.sh")
rex.bind(P .. "f", "sessionizer")

-- Session picker: Enter switches, Ctrl+X kills the highlighted session.
-- Replaces Rex's Cmd+K picker here because that one has no close key.
-- Cmd+K still opens Rex's own picker.
picker_action("session_picker", "Session Picker", "rex-sessions.sh")
rex.bind(P .. "s", "session_picker")

-- Close the session you are in (the picker refuses to kill its own session).
rex.bind(P .. "shift+x", "session.close")
-- Rex has no keyboard copy mode (tmux's [ with vi keys); Find is the closest.
-- TODO: rebind to a copy mode if Rex ships one.
rex.bind(P .. "[", "client.find.open")
rex.bind(P .. "ctrl+r", "client.config.reload")

-- ------------------------------------------------------------------------------
-- Resize mode: stands in for tmux's `bind -r` repeat
-- ------------------------------------------------------------------------------
-- Prefix, =, then hjkl as many times as needed; Esc or Enter leaves. Exclusive,
-- so a stray key is not typed into the terminal while resizing.
rex.mode("resize", { exclusive = true })
rex.bind(P .. "=", "client.mode.enter", { name = "resize" })
rex.bind("resize/h", "pane.resize", { direction = "left" })
rex.bind("resize/j", "pane.resize", { direction = "down" })
rex.bind("resize/k", "pane.resize", { direction = "up" })
rex.bind("resize/l", "pane.resize", { direction = "right" })
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")

-- ==============================================================================
-- Smart Ctrl+h/j/k/l (vim-tmux-navigator style)
-- ==============================================================================
-- Rex asks the pane which program is in front. Editors and pickers that use
-- these keys get them; anything else (the shell) moves pane focus instead.
-- Cost in the shell: Ctrl+K (kill to end of line) and Ctrl+L (clear) are taken;
-- Prefix + Ctrl+L below sends a real Ctrl+L.
-- TODO: the reverse direction (leaving nvim's edge split into a Rex pane) needs
-- the nvim side to run `rex do pane.focus.<dir>`.
local TERMINAL = "com.superlogical.terminal"
local PASSTHROUGH = { vim = true, nvim = true, view = true, fzf = true, lazygit = true }

local function foreground_program(block_id)
  local ok, info = pcall(rex.block.call, TERMINAL, "process", { block_id = block_id })
  if not ok or not info or not info.foreground then return nil end
  -- argv0 is the name you typed; `name` can be odd (claude reports "2.1.319").
  local fg = info.foreground
  return (fg.argv0 and fg.argv0:match("[^/]+$")) or fg.name
end

for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  local action = "smart_focus_" .. dir  -- custom action names can't contain a dot
  rex.action{
    name  = action,
    title = "Smart Focus " .. dir,
    run   = function(ctx)
      if PASSTHROUGH[foreground_program(ctx.block_id)] then
        rex.client.queue("pane.send_key", { key = "ctrl+" .. key })
      else
        rex.client.queue("pane.focus." .. dir)
      end
    end,
  }
  rex.bind("ctrl+" .. key, action)
end

rex.bind(P .. "ctrl+l", "pane.send_key", { key = "ctrl+l" })

-- ------------------------------------------------------------------------------
-- Direct keys outside the prefix (Cmd+E has no Rex default)
-- ------------------------------------------------------------------------------
rex.bind("cmd+e", "client.sidebar.toggle")
rex.bind(P .. "e", "client.sidebar.toggle")
