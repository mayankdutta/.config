fish_add_path ~/bin
alias run '~/bin/run.sh'
alias start_up_time '~/bin/start_up_time.sh'
alias react_library '~/bin/react.sh'
alias lvim '~/.local/bin/lvim'

ulimit -n 1024
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
