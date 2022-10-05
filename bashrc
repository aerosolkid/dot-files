# Load any supplementary scripts
for config in "$HOME"/.bashrc.d/*.bash ; do
  source "$config"
done
unset -v config

if [ "x${TERM_PROGRAM=}x" == "xiTerm.appx" ]
then
    echo -ne "\033]1;`hostname -s`\007"
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi
export PHP_USER_INCLUDE_ROOT=${HOME}/www
export EMAIL_CONTACT_LIST='gwebmailbox@interpublic.com'
export PHP_USER_INCLUDE_ROOT="${HOME}/www"
export IPG_CRON_HOME="${HOME}/cron"

#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
