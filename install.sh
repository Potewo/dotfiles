#!/bin/bash
# https://qiita.com/yutakatay/items/c6c7584d9795799ee164
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  local backupdir="$HOME/$dotdir/dotbackup"
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

link_to_homedir
command echo -e "\e[1;36m Install completed!!!! \e[m"

