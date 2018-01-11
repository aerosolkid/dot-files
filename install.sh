#!/bin/bash

#
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
#IFS=$'\n\t'
# older versions of bash choke on '-o pipefail',
# and we're not using pipes
#set -euo pipefail
set -u

dotfile_dir=`pwd`

# Create necessary directories
mkdir -p ~/.ssh

# cleanup old links
for dfile in ~/.*
do
  readlink $dfile | grep -q dotfiles;
  if [ $? -eq 0 ] # Grep found "dotfiles", so this is our link
  then
    rm -f $dfile
  fi
done


# Link files from dotfiles
for dotfile in aspell.en.prepl aspell.en.pws bashrc bashrc.d ctags emacs.d git-prompt-theme.sh gitconfig gitignore
do
  if [ -f ~/.${dotfile} ]
  then
    rm -f ~/.${dotfile}
  fi
  ln -s ${dotfile_dir}/${dotfile} ~/.${dotfile}
done

#ln -s ${dotfile_dir}/aspell.en.prepl ~/.aspell.en.prepl
#ln -s ${dotfile_dir}/aspell.en.pws   ~/.aspell.en.pws
#ln -s ${dotfile_dir}/bashrc          ~/.bashrc
#ln -s ${dotfile_dir}/bashrc.d        ~/.bashrc.d
#ln -s ${dotfile_dir}/ctags           ~/.ctags
#ln -s ${dotfile_dir}/emacs.d         ~/.emacs.d
#ln -s ${dotfile_dir}/gitconfig       ~/.gitconfig
#ln -s ${dotfile_dir}/gitignore       ~/.gitignore
#ln -s ${dotfile_dir}/hgrc            ~/.hgrc
#ln -s ${dotfile_dir}/hgignore        ~/.hgignore

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
