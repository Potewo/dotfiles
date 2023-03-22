# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Install and initialize zi
source <(curl -sL init.zshell.dev); zzinit

alias tmuxs='tmux new-session \; source-file ~/.tmux.auto-split.conf'

if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi

source ~/myenv.zsh

eval "$(starship init zsh)"
zinit light zsh-users/zsh-autosuggestions
zinit light z-shell/F-Sy-H
