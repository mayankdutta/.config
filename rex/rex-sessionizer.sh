#!/usr/bin/env bash
# ==============================================================================
# rex-sessionizer: pick a project folder, jump to its Rex session or create it
# ==============================================================================
# Port of ~/.config/tmux/tmux-sessionizer.sh. Like the tmux version, a session
# is matched by its label, which is the folder's basename with dots turned into
# underscores. Rex does not record a session's starting directory, so the label
# is the only stable key.
# ponytail: two folders with the same basename (e.g. two `apps/`) share one
# session, exactly as in tmux; prefix the label with the parent dir if that bites.
set -euo pipefail

myDirectories=(
  "$HOME/.config/"
  "$HOME/projects/"
  "$HOME/translations/"
  "$HOME/brevo/"
  "$HOME/"
  "$HOME/brevo/marketing-reports-frontend/apps/"
)

# A folder passed as an argument skips the picker, as in the tmux version.
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find "${myDirectories[@]}" -mindepth 0 -maxdepth 1 -type d 2>/dev/null | fzf) || exit 0
fi
[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

# Look the session up by label; create it only when no session has that label.
find_session() {
  rex ls --json | jq -r --arg name "$selected_name" \
    '.sessions[] | select(.label == $name) | .session_id' | head -n 1
}

session_id=$(find_session)
if [[ -z $session_id ]]; then
  rex new "$selected_name" -c "$selected" >/dev/null
  session_id=$(find_session)
fi

# Without -C, Rex picks the app when exactly one Rex app is connected.
# "do" is quoted so shellcheck doesn't read it as the shell keyword.
rex "do" session.select session_id="$session_id"
