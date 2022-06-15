alias luamake=/Users/info/.config/lua-language-server/3rd/luamake/luamake
export PATH=/bin:/usr/bin:/usr/local/bin:/Users/info/bin:/Users/info/.local/bin:/usr/local/bin:/opt/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/info/.cache/zsh4humans/v4/fzf/bin:/usr/local/opt/fzf/bin

path=(~/bin $path)
alias run='~/bin/run.sh'
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.0.2


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# z4h source $ZSH/plugins
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

plugins=(history-substring-search)

bindkey '^K' history-substring-search-up
bindkey '^N' history-substring-search-down

setopt rcs
. "$HOME/.cargo/env"

