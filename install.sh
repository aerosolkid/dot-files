#!/bin/bash

#
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
#IFS=$'\n\t'
# older versions of bash choke on '-o pipefail', 
# and we're not using pipes
#set -euo pipefail
set -eu

dotfile_dir=`pwd`

rm -f ~/.aliases
rm -f ~/.aspell.en.prepl
rm -f ~/.aspell.en.pws
rm -f ~/.bash_aliases
rm -f ~/.bash_profile
rm -f ~/.bash_prompt
rm -f ~/.bashrc
rm -f ~/.ctags
rm -f ~/.exports
rm -f ~/.functions
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -f ~/.hgrc
rm -f ~/.hgignore
rm -f ~/.path

ln -s ${dotfile_dir}/.aliases         ~/
ln -s ${dotfile_dir}/.aspell.en.prepl ~/
ln -s ${dotfile_dir}/.aspell.en.pws   ~/
ln -s ${dotfile_dir}/.bash_profile    ~/
ln -s ${dotfile_dir}/.bash_prompt     ~/
ln -s ${dotfile_dir}/.bashrc          ~/
ln -s ${dotfile_dir}/.ctags           ~/
ln -s ${dotfile_dir}/.exports         ~/
ln -s ${dotfile_dir}/.functions       ~/
ln -s ${dotfile_dir}/.gitconfig       ~/
ln -s ${dotfile_dir}/.gitignore       ~/
ln -s ${dotfile_dir}/.hgrc            ~/
ln -s ${dotfile_dir}/.hgignore        ~/
ln -s ${dotfile_dir}/.path            ~/
