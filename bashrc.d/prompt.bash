if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=yes

if [ "${EMACS:-f}" = "t" ]; then
    export TERM=xterm
fi

if [ ${INSIDE_EMACS+x} ];then
  ITERM_TAB=''
else
  ITERM_TAB=']1;\h\007'
fi

SEP=$'\x2d'
BULLET=$'\xe2\x96\xb8'

#http://bashrcgenerator.com
export PS1="$ITERM_TAB\n\[[1;37m\]$SEP\[[0m\] \u\[[00;37m\]@\h \[[1;37m\]$SEP\[[0m\] \[[00;36m\]\w \[[1;35m\]$(__git_ps1 "[%s]")\[[0m\]\n\[[38;5;46m\]$BULLET\[[0m\] \[[1;37m\]\\$\[[0m\] "
