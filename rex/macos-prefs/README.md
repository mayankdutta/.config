# Rex macOS preferences

A self-contained folder that carries Rex's **Settings-window** choices to
another Mac: theme, font, tab style, sidebar, pane density, copy-on-select and
the rest (`Workspace.*` keys).

## Why this folder exists

Rex's `~/.config/rex/init.lua` can only bind keys. Settings-window choices are
stored by macOS in `~/Library/Preferences/com.superlogical.rex.plist`, outside
`~/.config`, so copying the dotfiles alone loses them. This folder snapshots
them into a file that does travel.

| File | What it holds |
|---|---|
| `prefs.plist` | The exported settings (XML plist, readable and diffable) |
| `rex-prefs.sh` | Moves `prefs.plist` into and out of macOS preferences |
| `README.md` | This file |

The script looks for `prefs.plist` **next to itself**, so the folder works
wherever it lives. Point it at another file with
`REX_PREFS_FILE=/path/to/prefs.plist`.

## Full Rex setup on a new Mac

```
~/.config/rex/
├── init.lua              key bindings        → Rex loads it automatically
├── rex-sessionizer.sh    session helpers     → called from init.lua
├── rex-sessions.sh
└── macos-prefs/          this folder         → import by hand (step 3)
```

1. Install Rex, open it once so it creates its preferences, then **quit it**
   (`Cmd+Q`). If Rex is running during the import, it may overwrite the
   imported values when it quits.
2. Restore the folder:
   ```sh
   mkdir -p ~/.config
   cp -R /path/to/backup/rex ~/.config/rex   # or git clone / unzip your dotfiles
   chmod +x ~/.config/rex/*.sh ~/.config/rex/macos-prefs/*.sh
   ```
3. Import the preferences:
   ```sh
   ~/.config/rex/macos-prefs/rex-prefs.sh import
   ```
   This merges into the existing preferences, so the new Mac's window
   positions and updater state are kept.
4. Install the terminal font, or Rex falls back to a default:
   ```sh
   brew install --cask font-maple-mono-nf
   ```
5. Start Rex. Check the key bindings with `rex config check` and `rex keymap`.

## Keeping it current

`prefs.plist` is a snapshot. After changing anything in Rex Settings, run:

```sh
~/.config/rex/macos-prefs/rex-prefs.sh export
```

To see what an import would change, compare the two sides:

```sh
diff <(plutil -p ~/.config/rex/macos-prefs/prefs.plist) \
     <(defaults export com.superlogical.rex - | plutil -p -)
```

## Deliberately not carried over

- Window frames: they depend on this Mac's screen size.
- `RexSync.servers`, `Workspace.lastFocusedSession`, `Workspace.openWindows`,
  `Workspace.programActivitySeen`: they refer to sessions and servers on this
  Mac.
- Sparkle updater keys (`SU*`): the new install sets its own.
- `~/Library/Application Support/rex/`: live sockets, terminal snapshots and
  logs for the running server.

To move one of these anyway, edit the `SKIP` set, or the `Workspace.` prefix
filter, in `rex-prefs.sh`.

## Reusing this for another Mac app

The script only depends on the app's defaults domain. To reuse it, copy the
folder, then change `DOMAIN=` and the `Workspace.` prefix and `SKIP` set in
the Python block. Find an app's domain with `defaults domains | tr ',' '\n'`.
