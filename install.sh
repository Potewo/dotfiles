#!/bin/bash
# https://qiita.com/yutakatay/items/c6c7584d9795799ee164
echo "start"
set -ue
echo "1"
helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}
echo "2"
# set -ue <-> command exist check
install_starship() {
  echo "a"
  type starship > /dev/null 2>&1
  echo "b"
  if [ $? -eq 0 ] ; then # コマンドが存在すれば
    echo "c"
    command echo "starship is already exist. skipped installing."
    echo "d"
  else
    echo "e"
    command echo "starship is not found. start installing."
    echo "f"
    curl -fsSL https://starship.rs/install.sh | bash
    echo "g"
  fi
}
echo "3"
install_zinit() {
  type starship > /dev/null 2>&1
  if [ $? -eq 0 ] ; then # コマンドが存在すれば
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
echo "5"
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
echo "6"
install_starship
echo "7"
install_zinit
echo "8"
link_to_homedir
echo "9"
command echo -e "\e[1;36m Install completed!!!! \e[m"
echo "10"
