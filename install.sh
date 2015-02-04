#!/bin/bash

#
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
set -euo pipefail
IFS=$'\n\t'

dotfile_dir=`pwd`

rm -f ~/.aspell.en.prepl
rm -f ~/.aspell.en.pws
rm -f ~/.bash_profile
rm -f ~/.bashrc
rm -f ~/.hgrc
rm -f ~/.hgignore
rm -f ~/.gitconfig
rm -f ~/.gitignore

ln  -s ${dotfile_dir}/.aspell.en.prepl ~/.aspell.en.prepl
ln  -s ${dotfile_dir}/.aspell.en.pws   ~/.aspell.en.pws
ln  -s ${dotfile_dir}/.bash_profile    ~/.bash_profile
ln  -s ${dotfile_dir}/.bashrc          ~/.bashrc
ln  -s ${dotfile_dir}/.hgrc            ~/.hgrc
ln  -s ${dotfile_dir}/.hgignore        ~/.hgignore
ln  -s ${dotfile_dir}/.gitconfig       ~/.gitconfig 
ln  -s ${dotfile_dir}/.gitignore       ~/.gitignore
