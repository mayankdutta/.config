
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

myDirectories=(
"$HOME/lumi/axp-lumi-login"
"$HOME/lumi/axp-lumi-home"
"$HOME/lumi/axp-lumi-data-market-place/"
"$HOME/lumi/axp-lumi-use-case-management/"
"$HOME/lumi/axp-lumi-business-managed-data/"
"$HOME/lumi/axp-lumi-data-ingestion-management/"
"$HOME/lumi/axp-lumi-data-transformation-management/"
"$HOME/lumi/axp-lumi-root/"
"$HOME/lumi"
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
  selected_firs=$(printf '%s\n' "${myDirectories[@]}" | fzf)

  if [[ -n "$selected_firs" ]]; then
    cd "$selected_firs" || return 1
  else echo "No Directory selected."
  fi
}

bindkey -s '^f' 'fzf_jump_to_nvim\n'

alias dks='docker stop $(docker ps -a -q)'
alias dkr='docker rm $(docker ps -a -q)'
alias nbm="/Users/mdutt14/.nvm/versions/node/v16.20.2/bin/npm run build"
alias ntm="/Users/mdutt14/.nvm/versions/node/v16.20.2/bin/npm run test:unit -- -u"
alias nrm="/Users/mdutt14/.nvm/versions/node/v16.20.2/bin/npm run start"
alias one="dks && dkr && /Users/mdutt14/.nvm/versions/node/v16.20.2/bin/npm run start"

alias tmux-sessionizer="~/.config/tmux/tmux-sessionizer.sh"

alias one1="cd /Users/mdutt14/lumi/one-app && npm start -- --root-module-name=axp-lumi-root"
# alias serve="cd /Users/mdutt14/lumi/ && zsh automate.sh"


# alias one="cd /Users/mdutt14/lumi/one-app && npm start -- --root-module-name=axp-lumi-root"
# alias serve="cd /Users/mdutt14/lumi/ && zsh automate.sh"

# exa stuff
alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

# eval "$(starship init zsh)"

