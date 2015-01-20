if [ "$PS1" ]
then
  stty erase '^?'
  stty echoe
  stty intr '^C'
  stty kill '^K'

  if [ -f ~/.dropbox-dist/dropoxd ]
  then
    . ~/.dropbox-dist/dropboxd 2>&1 >> ~/logs/dropbox&
  fi    

  if [ -f ~/.bashrc ]
  then
    . ~/.bashrc
  fi    
fi
