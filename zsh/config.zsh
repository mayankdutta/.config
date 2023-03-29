ulimit -n 1024

alias luamake=/Users/info/.config/lua-language-server/3rd/luamake/luamake
export PATH=/bin:/usr/bin:/usr/local/bin:/Users/info/bin:/Users/info/.local/bin:/usr/local/bin:/opt/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/info/.cache/zsh4humans/v4/fzf/bin:/usr/local/opt/fzf/bin
export STARSHIP_CONFIG=~/.config/starship.toml
export PATH="$HOME/.cargo/bin:$PATH"

path=(~/bin $path)
alias run='~/bin/run.sh'
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.0.2


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/exa"

plug "wintermi/zsh-starship"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

plug "zap-zsh/completions"
