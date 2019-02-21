export ALTERNATE_EDITOR=""
if [ ${INSIDE_EMACS+x} ];then
  export EDITOR=vi
else
  export EDITOR="emacsclient --tty"
fi
export EMAIL="mark@mpc.io"
export GPG_TTY=$(tty)
export HOMEBREW_NO_ANALYTICS=1
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export NAME="Mark Clements"
export PROMPT_DIRTRIM=3

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
export HISTIGNORE='&:ls:[bf]g:exit'
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

if [ -d /opt/local/lib ]; then
  export LD_LIBRARY_PATH=/opt/local/lib
fi
if [ -d /usr/local/lib ]; then
  export LD_LIBRARY_PATH=/usr/local/lib
fi
if [ -d /opt/local/man ]; then
  export MANPATH=/opt/local/man:$MANPATH
fi
if [ -d /usr/local/share/man/man ]; then
  export MANPATH=/usr/local/share/man/man:$MANPATH
fi
if [ -d /usr/local/opt/coreutils/libexec/gnuman ]; then
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
fi

### local config settings, if any

if [ -e $HOME/.bashrc.local ]; then
  source $HOME/.bashrc.local
fi
