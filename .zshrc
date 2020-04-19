# export PS1="
# %10F%m%f:%11F%1~%f \$ "
alias ls="ls -G"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

### Added by Zplugin's installer
source '/Users/rensekine/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
zplugin light zsh-users/zsh-autosuggestions
# usage:press right allow key
zplugin light zdharma/fast-syntax-highlighting

. /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/rensekine/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/rensekine/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/rensekine/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/rensekine/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
