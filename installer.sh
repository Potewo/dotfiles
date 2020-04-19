#!/bin/bash
cd $HOME
git clone https://github.com/Potewo/dotfiles.git
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
sh ./dein-installer.sh ~/.cache/dein
declare -A DOT_FILES;

DOT_FILES=(
  [".zshrc"]="$HOME/.zshrc"
  [".vimrc"]="$HOME/.vimrc"
  ["init.vim"]="$HOME/.config/nvim/init.vim"
)

DIRS=("$HOME/.config/nvim")

makedirectory() {
  for DIR in {DIRS[@]}
  do
    mkdir -p $DIR
  done
}

for file in ${!DOT_FILES[@]};
do
  ln -s $HOME/dotfiles/$file ${DOT_FILES[$file]}
done
