# export PS1="
# %10F%m%f:%11F%1~%f \$ "
alias ls="ls -G"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

### Added by Zplugin's installer
source '$HOME/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
zplugin light zsh-users/zsh-autosuggestions
# usage:press right allow key
zplugin light zdharma/fast-syntax-highlighting

. /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

eval "$(rbenv init -)"
