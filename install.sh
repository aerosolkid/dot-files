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

# Create necessary directories
mkdir -p ~/.ssh

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

ln -s ${dotfile_dir}/aspell.en.prepl ~/.aspell.en.prepl
ln -s ${dotfile_dir}/aspell.en.pws   ~/.aspell.en.pws
ln -s ${dotfile_dir}/bashrc          ~/.bashrc
ln -s ${dotfile_dir}/bashrc.d        ~/.bashrc.d
ln -s ${dotfile_dir}/ctags           ~/.ctags
ln -s ${dotfile_dir}/gitconfig       ~/.gitconfig
ln -s ${dotfile_dir}/gitignore       ~/.gitignore
ln -s ${dotfile_dir}/hgrc            ~/.hgrc
ln -s ${dotfile_dir}/hgignore        ~/.hgignore

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
