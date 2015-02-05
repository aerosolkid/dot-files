if [ "$PS1" ]
then
  stty erase '^?'
  stty echoe
  stty intr '^C'
  stty kill '^K'

  if [ -f ~/.bashrc ]
  then
    . ~/.bashrc
  fi    
fi
