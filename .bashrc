id=`id -u`
hnam=`hostname -s | tr '[:upper:]' '[:lower:]'`

shopt -s histappend
shopt -s cdspell
shopt -s cmdhist
export HISTIGNORE="&:ls:[bf]g:exit"

export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/bin:$PATH
#export PATH=/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/Dropbox/bin:$PATH
export PATH=$HOME/bin:/usr/X11R6/bin:$PATH

export LD_LIBRARY_PATH=/opt/local/lib

export MANPATH=/opt/local/man:$MANPATH

export DISPLAY=:0.0

if [ "${hnam}" != "omaedcwww029" ]
then
    export TNS_ADMIN="/Usrs/mpc/instantclient_10_2"
else
    export LPDEST=HP_Laserjet_8150
    export LD_LIBRARY_PATH=/usr/lib/oracle/10.2.0.4/client/lib
    alias hux='cd ~/www/huxley'
    alias nagchk='/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg'
fi

export PATH=$PATH:$TNS_ADMIN/bin

alias ls='ls -h --color=auto'
alias l='ls -ltr --color=auto | tail'

alias who='who -uH'
alias h='history'
alias cls='clear'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias showmethepackets="sudo tcpdump -A -p -q -s0 src port 80 or dst port 80"

alias top='/usr/bin/top -o cpu -O vsize -S'

# Show lines that are not blank or commented out
alias active='grep -v -e "^$" -e"^ *#"'

# Show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# Make a directory and CD into it
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# What's eating up all the memory?
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

# Tail with search highlight
t() { 
tail -f $1 | perl -pe "s/$2/\e[1;31;43m$&\e[0m/g"
}

# copy public key to remote machine 
function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_dsa.pub
}

# Yoinked from http://brettterpstra.com/2009/11/14/fk-a-useful-bash-function/
# FK: ‘fk’ is short for Find and Kill, and it does a quick search of your
# running processes for a case-insensitive partial match of the first parameter
# passed to it
#
# run fk process, where process is a partial name of a running application or
# UNIX process. You’ll get a menu with the matches, and you can kill a
# specific process by typing its number at the prompt.
# "Cancel" is the first option.

fp () { #find and list processes matching a case-insensitive partial-match string
                ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () { 
        IFS=$'\n'
        PS3='Kill which process? (1 to cancel): '
        select OPT in "Cancel" $(fp $1); do
                if [ $OPT != "Cancel" ]; then
                        kill $(echo $OPT|awk '{print $NF}')
                fi
                break
        done
        unset IFS
}

# Start an HTTP server from a directory, optionally specifying the port

function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

umask 002
