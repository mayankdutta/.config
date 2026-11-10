#!/usr/bin/env bash
# ==============================================================================
# rex-sessions: keyboard session picker
# ==============================================================================
# Rex's built-in picker (Cmd+K) has no key for closing the highlighted session,
# so this fzf picker stands in: Enter switches to the highlighted session,
# Ctrl+X kills it and refreshes the list in place.
#
# fzf calls this same script back with --list / --kill so the list and the
# guard below live in one file.
set -euo pipefail

self=$0

# One line per session: "<id>\t<label>". fzf shows only the label.
list_sessions() {
  rex ls --json | jq -r '.sessions[] | "\(.session_id)\t\(.label // "(unnamed)")"'
}

case "${1:-}" in
  --list)
    list_sessions
    exit 0
    ;;
  --kill)
    # The picker runs inside the current session; killing that session would
    # kill the picker too, so refuse it. Close the current one with Ctrl+Space X.
    if [[ $2 == "${REX_SESSION:-}" ]]; then
      exit 0
    fi
    rex kill "$2" >/dev/null
    exit 0
    ;;
esac

choice=$(list_sessions | fzf \
  --delimiter=$'\t' --with-nth=2 \
  --header='enter: switch   ctrl-x: kill (not the current session)' \
  --bind "ctrl-x:execute-silent($self --kill {1})+reload($self --list)") || exit 0

session_id=${choice%%$'\t'*}
# "do" is quoted so shellcheck doesn't read it as the shell keyword.
rex "do" session.select session_id="$session_id"
