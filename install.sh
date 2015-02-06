#!/bin/bash

#
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
IFS=$'\n\t'
# older versions of bash choke on '-o pipefail', 
# and we're not using pipes
#set -euo pipefail
set -eu

dotfile_dir=`pwd`

rm -f ~/.aspell.en.prepl
rm -f ~/.aspell.en.pws
rm -f ~/.bash_profile
rm -f ~/.bash_aliases
rm -f ~/.bashrc
rm -f ~/.hgrc
rm -f ~/.hgignore
rm -f ~/.gitconfig
rm -f ~/.gitignore

ln  -s ${dotfile_dir}/.aspell.en.prepl ~/
ln  -s ${dotfile_dir}/.aspell.en.pws   ~/
ln  -s ${dotfile_dir}/.bash_profile    ~/
ln  -s ${dotfile_dir}/.bash_aliases    ~/
ln  -s ${dotfile_dir}/.bashrc          ~/
ln  -s ${dotfile_dir}/.hgrc            ~/
ln  -s ${dotfile_dir}/.hgignore        ~/
ln  -s ${dotfile_dir}/.gitconfig       ~/
ln  -s ${dotfile_dir}/.gitignore       ~/
