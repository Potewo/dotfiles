#!/bin/bash
# https://qiita.com/yutakatay/items/c6c7584d9795799ee164
echo "start"
set -ue
helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}
install_starship() {
  if type starship > /dev/null 2>&1; then # コマンドが存在すれば
    command echo "starship is already exist. skipped installing."
  else
    command echo "starship is not found. start installing."
    curl -fsSL https://starship.rs/install.sh | bash
  fi
}
install_zinit() { 
  if type zinit > /dev/null 2>&1; then # コマンドが存在すれば
    command echo "zinit is already exist. skipped installing."
  else
    command echo "zinit is not found. start installing."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
  fi
}

install_dein() {
  if [[ -e "$HOME/.cache/dein" ]];then
    command echo "dein is already instaled"
  else
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/installer.sh
    sh ~/installer.sh ~/.cache/dein
  fi
}


link_to_homedir() {
  # example: script_dir = /home/user/dotfiles
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  # example: dot_dir = /home/user
  local dotdir=$(dirname ${script_dir})
  local backupdir="$HOME/dotbackup"
  local targets=`find $HOME/dotfiles/files/.[!.]* -type f`
  command echo "dotdir = " $dotdir
  command echo "script_dir = " $script_dir
  command echo "backup_dir = " $backupdir
  command echo "targets = " $targets
  command echo "backup old dotfiles..."

  if [ ! -d $backupdir ];then
    command echo "$backupdir not found. Auto Make it"
    command mkdir $backupdir
  fi
  # create myenv
  if [[ ! -e "$HOME/myenv.zsh" ]]; then
    touch $HOME/myenv.zsh
    chmod a+rx $HOME/myenv.zsh
  fi
  if [[ "$HOME" != "$script_dir" ]];then
    for file in $targets; do
      local f=${file#*dotfiles/files/}
      # [[ `basename $f` == ".zshrc" ]] && continue
      if [[ ! -e $(dirname $f) ]];then
        mkdir -p $(dirname $f)
      fi

      if [[ -L "$HOME/$f" ]];then
        command rm -f "$HOME/$f"
      fi

      if [[ -e "$HOME/$f" ]];then
        command mv "$HOME/$f" "$backupdir/$f"
      fi
      command ln -snf $HOME/dotfiles/files/$f $HOME/$f
    done
  else
    command echo "same install src dest"
  fi
}
while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done
install_starship
install_zinit
install_dein
link_to_homedir
command echo -e "\e[1;36m Install completed!!!! \e[m"
