if [ "${EMACS:-f}" = "t" ]; then
  export TERM=xterm
fi

if [ ${INSIDE_EMACS+x} ];then
  ITERM_TAB=''
else
  ITERM_TAB=']1;\h\007'
fi

BULLET=$'\xe2\x96\xb8'

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  # Set config variables first
  # GIT_PROMPT_ONLY_IN_REPO=1

  # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
  # GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

  # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
  # GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

  # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

  # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

  # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
  # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

  # as last entry source the gitprompt script
  # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
  GIT_PROMPT_THEME_FILE=~/.git-prompt-theme.sh
  GIT_PROMPT_THEME=Custom
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
elif [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=yes
  PROMPT_COMMAND='__git_ps1 "$ITERM_TAB\n\[[0;32m\]$BULLET\[[1;31m\] \u\[[0;31m\]@\[[0;31m\]\h  \[[1;36m\]\w\[[1;35m\]" "\[[0m\]\n\[[0;34m\]\\\$\[[0m\] "'
fi

#http://bashrcgenerator.com
#export PS1="$ITERM_TAB\n\[[38;5;46m\]$BULLET\[[0m\] \u\[[00;37m\]@\h  \[[00;36m\]\w \[[1;35m\]$(__git_ps1 "[%s]")\[[0m\]\n\[[1;37m\]\\$\[[0m\] "
