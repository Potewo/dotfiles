#!/bin/bash
# https://qiita.com/yutakatay/items/c6c7584d9795799ee164
echo "start"
set -ue
helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}
# set -ue <-> command exist check
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
echo "4"
link_to_homedir() {

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  local backupdir="$HOME/dotbackup"
  command echo "dotdir = " $dotdir
  command echo "script_dir = " $script_dir
  command echo "local_dir = " $backupdir
  command echo "backup old dotfiles..."
  if [ ! -d $backupdir ];then
    command echo "$backupdir not found. Auto Make it"
    command mkdir $backupdir
  fi

  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      [[ `basename $f` == ".zshrc" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" $backupdir
      fi
      command ln -snf $f $HOME
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
link_to_homedir
command echo -e "\e[1;36m Install completed!!!! \e[m"
