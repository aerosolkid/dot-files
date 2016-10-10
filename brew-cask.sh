# -*- mode: shell-script -*-
# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# QuickLook Plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webpquicklook
brew cask install suspicious-package

# daily
brew cask install adium
#brew cask install alfred
#brew cask install bartender
brew cask install clamxav
brew cask install controlplane
brew cask install default-folder-x
brew cask install emacs
#brew cask install flux
brew cask install hazel
#brew cask install rescuetime
#brew cask install textexpander
#brew cask install totalfinder
brew cask install quicksilver
#brew cask install vmware-fusion

# dev
brew cask install iterm2
#brew cask install sublime-text
brew cask install imagealpha
brew cask install imageoptim
brew cask install kaleidoscope
brew cask install sourcetree

# fun
#brew cask install limechat
#brew cask install miro-video-converter
brew cask install vimediamanager

# browsers
brew cask install google-chrome
#brew cask install google-chrome-canary
brew cask install firefox
#brew cask install firefox-nightly --force
#brew cask install webkit-nightly --force
#brew cask install chromium --force
#brew cask install torbrowser

# less often
brew cask install cyberduck
#brew cask install disk-inventory-x
#brew cask install screenflow4 # 4 specifically not 5.
brew cask install private-eye
brew cask install vlc
#brew cask install keycastr  
brew cask install handbrakecli
