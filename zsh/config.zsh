# auto-start tmux if not already inside one
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux new-session -A -s main
fi


[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH=$JAVA_HOME/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

myDirectories=(
"$HOME/.config/"
"$HOME/.config/nvim/"
"$HOME/.config/kitty/"
"$HOME/.config/tmux/"
"$HOME/.config/fish"
"$HOME/.config/alacritty/"
"$HOME/"
"$HOME/projects/"
)

function fzf_jump_to_nvim() {
  selected_firs=$(find ~/lumi ~/info ~/projects ~/.config -mindepth 0 -maxdepth 1 -type d | fzf)

  if [[ -n "$selected_firs" ]]; then
    cd "$selected_firs" || return 1
  else echo "No Directory selected."
  fi
}

bindkey -s '^f' 'fzf_jump_to_nvim\n'

alias dks='docker stop $(docker ps -a -q)'
alias dkr='docker rm $(docker ps -a -q)'
alias nbm="npm run build"
alias ntm="npm run test:unit -- -u"
alias nrm="npm run start"
alias one="dks && dkr && npm run start"

alias tmux-sessionizer="~/.config/tmux/tmux-sessionizer.sh"
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"

# exa stuff
alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias lg='lazygit'
alias cra='npm create vite@latest'

alias n='nvim'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
