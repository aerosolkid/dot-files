# Load any supplementary scripts
for config in "$HOME"/.bashrc.d/*.bash ; do
  source "$config"
done
unset -v config

if [ "x${TERM_PROGRAM=}x" == "xiTerm.appx" ]
then
    echo -ne "\e]1;`hostname -s`\a"
fi
