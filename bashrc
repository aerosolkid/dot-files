# Load any supplementary scripts
for config in "$HOME"/.bashrc.d/*.bash ; do
  source "$config"
done
unset -v config

echo -ne "\e]1;`hostname -s`\a"

PATH="/Users/mpc/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/mpc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/mpc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/mpc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mpc/perl5"; export PERL_MM_OPT;
