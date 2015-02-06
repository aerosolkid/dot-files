# If not running interactively, don't do anything
[ -z "$PS1" ] && return

id=`id -u`
hnam=`hostname -s | tr '[:upper:]' '[:lower:]'`

HISTIGNORE="&:ls:[bf]g:exit"
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell

umask 002

if [ ${EMACS:-f} = "t" ]; then
    export TERM=xterm
fi

export PATH=~/bin:~/Dropbox/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export LD_LIBRARY_PATH=/opt/local/lib
export MANPATH=/opt/local/man:$MANPATH

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

## Yoinked from: http://blog.grahampoulter.com/2011/09/show-current-git-bazaar-or-mercurial.html
## Print nickname for git/hg/bzr/svn version control in CWD
## Optional $1 of format string for printf, default "(%s) "
function be_get_branch {
  local dir="$PWD"
  local vcs
  local nick
  while [[ "$dir" != "/" ]]; do
    for vcs in git hg svn bzr; do
      if [[ -d "$dir/.$vcs" ]] && hash "$vcs" &>/dev/null; then
        case "$vcs" in
          git) __git_ps1 "${1:-(git:%s)}"; return;;
          hg) nick=$(hg branch 2>/dev/null);;
          svn) nick=$(svn info 2>/dev/null\
                | grep -e '^Repository Root:'\
                | sed -e 's#.*/##');;
          bzr)
            local conf="${dir}/.bzr/branch/branch.conf" # normal branch
            [[ -f "$conf" ]] && nick=$(grep -E '^nickname =' "$conf" | cut -d' ' -f 3)
            conf="${dir}/.bzr/branch/location" # colo/lightweight branch
            [[ -z "$nick" ]] && [[ -f "$conf" ]] && nick="$(basename "$(< $conf)")"
            [[ -z "$nick" ]] && nick="$(basename "$(readlink -f "$dir")")";;
        esac
        [[ -n "$nick" ]] && printf "${1:-(%s:%s)}" "$vcs" "$nick"
        return 0
      fi
    done
    dir="$(dirname "$dir")"
  done
}
## Add branch to PS1 (based on $PS1 or $1), formatted as $2
export GIT_PS1_SHOWDIRTYSTATE=yes
#export PS1="\$(be_get_branch "$2")${PS1}";

#http://bashrcgenerator.com
export PS1="\[\e[00;33m\]\u\[\e[0m\]\[\e[00;37m\]@\h:\[\e[0m\]\[\e[00;36m\][\W\[\e[0m\]\[\e[00;35m\]\$(be_get_branch "$2")\[\e[0m\]\[\e[00;36m\]]\[\e[0m\]\[\e[00;37m\]\\$ \[\e[0m\]"

if [ "${hnam}" != "omaedcwww029" ]
then
    export TNS_ADMIN="/Usrs/mpc/instantclient_10_2"
    export PATH=$PATH:$TNS_ADMIN/bin
else
    export LPDEST=HP_Laserjet_8150
    export LD_LIBRARY_PATH=/usr/lib/oracle/10.2.0.4/client/lib
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
