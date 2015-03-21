apps=(
#dropbox
#google-chrome
#firefox
spotify
vagrant
flash
iterm2
sublime-text3
virtualbox
atom
evernote
flux
#mailbox
sketch
vlc
skype
emacs
macvim
spectacle
postgres
)

echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
