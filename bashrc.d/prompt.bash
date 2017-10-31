if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=yes

if [ "${EMACS:-f}" = "t" ]; then
    export TERM=xterm
fi

#export PS1="\u@\h:[\W\$(be_get_branch "$2")]\\$ "
#http://bashrcgenerator.com
export PS1=$'\n\[[1;37m\]\x2d\[[0m\] \u\[[00;37m\]@\h \[[1;37m\]\x2d\[[0m\] \[[00;36m\]\w \[[1;35m\]$(__git_ps1 "[%s]")\[[0m\]\n\[[38;5;46m\]\xe2\x96\xb8\[[0m\] \[[1;37m\]\\$\[[0m\] '
