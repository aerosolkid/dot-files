# copy paste this file in bit by bit.


# read migration.md where more migrationy tips are.


# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
#bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# https://rvm.io
# rvm for the rubiess
#curl -L https://get.rvm.io | bash -s stable --ruby

# homebrew!
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install all the things
./brew.sh
./brew-cask.sh


# https://github.com/rupa/z
# z, oh how i love you
#cd ~/src
#git clone https://github.com/rupa/z.git
#chmod +x ~/src/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

# z binary is already referenced from .bash_profile


# https://github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys
#cd ~/src
#git clone https://github.com/thebitguru/play-button-itunes-patch


# my magic photobooth symlink -> dropbox. I love it.
# + first move Photo Booth folder out of Pictures
# + then start Photo Booth. It'll ask where to put the library.
# + put it in Dropbox/public
# * now you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# * then you grab public URL and send off your video message in a heartbeat.


# for the c alias (syntax highlighted cat)
sudo easy_install Pygments


# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
sudo -s "(echo $BASHPATH >> /etc/shells)"
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# Later, confirm iterm settings aren't conflicting.


