# -*- mode: shell-script -*-
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

if [ ${EMACS:-f} = "t" ]; then
    export TERM=xterm
fi
#export PS1="\u@\h:[\W\$(be_get_branch "$2")]\\$ "
#http://bashrcgenerator.com
export PS1="\[[00;33m\]\u\[[0m\]\[[00;37m\]@\h:\[[0m\]\[[00;36m\][\W\[[0m\]\[[00;35m\]\$(be_get_branch "$2")\[[0m\]\[[00;36m\]]\[[0m\]\[[00;37m\]\[[0m\]\\$ "
