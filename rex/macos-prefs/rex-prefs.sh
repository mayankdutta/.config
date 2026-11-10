#!/usr/bin/env bash
# ==============================================================================
# Rex GUI preferences <-> dotfiles
# ==============================================================================
# Rex keeps key bindings in ~/.config/rex/init.lua, but everything set in its
# Settings window (theme, font, tab style, sidebar...) lives in the macOS
# defaults domain com.superlogical.rex. This copies the portable Workspace.*
# settings into prefs.plist next to this script so they travel with the dotfiles.
#
#   rex-prefs.sh export   # this Mac     -> prefs.plist
#   rex-prefs.sh import   # prefs.plist  -> this Mac (quit Rex first)
#
# Skipped on purpose: window frames, RexSync.servers, Sparkle updater keys and
# per-machine state (lastFocusedSession, openWindows, programActivitySeen).
# They point at screens/sessions on this Mac and are noise anywhere else.
set -euo pipefail

DOMAIN=com.superlogical.rex
FILE="${REX_PREFS_FILE:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/prefs.plist}"

case "${1:-}" in
  export | import) ;;
  *) echo "usage: ${0##*/} export|import" >&2; exit 2 ;;
esac

# plistlib keeps every value's type (bool/int/string/data), which
# `defaults read` output and JSON conversion both lose.
defaults export "$DOMAIN" - | /usr/bin/python3 -I -c '
import plistlib, sys
mode, path = sys.argv[1], sys.argv[2]
SKIP = {"Workspace.lastFocusedSession", "Workspace.openWindows",
        "Workspace.programActivitySeen"}
current = plistlib.loads(sys.stdin.buffer.read())  # pipes are not seekable

if mode == "export":
    keep = {k: v for k, v in current.items()
            if k.startswith("Workspace.") and k not in SKIP}
    with open(path, "wb") as f:
        plistlib.dump(keep, f, sort_keys=True)
    print(f"Exported {len(keep)} settings to {path}")
else:
    # Merge, so updater and window state already on this Mac survive.
    with open(path, "rb") as f:
        current.update(plistlib.load(f))
    sys.stdout.buffer.write(plistlib.dumps(current, fmt=plistlib.FMT_BINARY))
' "$1" "$FILE" | if [[ $1 == import ]]; then
  defaults import "$DOMAIN" - && echo "Imported $FILE. Start Rex to pick it up."
else
  cat
fi
