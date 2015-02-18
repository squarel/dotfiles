ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

binaries=(
  graphicsmagick
  webkit2png
  rename
  zopfli
  ffmpeg
  #python
  sshfs
  trash
  #node
  tree
  ack
  hub
  git
  mercurial
  emacs
  tmux
)

brew install ${binaries[@]}

gnu=(
  coreutils
  findutils
  bash
)

brew install ${gnu[@]}

brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install caskroom/cask/brew-cask
