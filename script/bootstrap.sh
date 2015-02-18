# TODO:
# python env, ruby env
# postgresql

red='\033[0;31m'
light_green='\e[1;32m'
NC='\033[0m'
OS="$(uname)"
debug_mode=1

echo "${red}"'                                _       _       _    __ _ _           '"${NC}"
echo "${red}"'                               | |     | |     | |  / _(_) |          '"${NC}"
echo "${red}"' ___  __ _ _   _  __ _ _ __ ___| |   __| | ___ | |_| |_ _| | ___  ___ '"${NC}"
echo "${red}"'/ __|/ _` | | | |/ _` | |__/ _ \ |  / _` |/ _ \| __|  _| | |/ _ \/ __|'"${NC}"
echo "${red}"'\__ \ (_| | |_| | (_| | | |  __/ | | (_| | (_) | |_| | | | |  __/\__ \\'"${NC}"
echo "${red}"'|___/\__, |\__,_|\__,_|_|  \___|_|  \__,_|\___/ \__|_| |_|_|\___||___/'"${NC}"
echo "${red}"'        | |                                                           '"${NC}"
echo "${red}"'        |_|                                                           '"${NC}"

# helper functions
debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line\
            ${BASH_LINENO[$i+1]}"
    fi
}

ubuntu_install() {
    echo "sudo apt-get update"
    sudo apt-get update
    echo "sudo apt-get -y install curl git zsh"
    sudo apt-get -y install curl git zsh mercurial
}


clone_repo() {
    hash git > /dev/null && /usr/bin/env git clone https://github.com/squarel/dotfiles.git ~/.dotfiles || {
        echo "git not installed"
        exit
    }
}

ohmyzsh() {
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    if [ "$OS" = "Darwin" ]; then
        ln -sf "$HOME/.dotfiles/.zshrc.osx" "$HOME/.zshrc"
    elif [ "$OS" = "Linux" ]; then
        ln -sf "$HOME/.dotfiles/.zshrc.linux" "$HOME/.zshrc"
    fi
    ln -sf "$HOME/.dotfiles/custom" "$HOME/.oh-my-zsh/custom"
    ret="$?"
    debug
}

vim() {
    # compile from scratch
    sudo apt-get -y remove vim-common vim-runtime
    sudo apt-get build-dep vim
    hash hg > /dev/null && /usr/bin/env hg clone https://vim.googlecode.com/hg/ /tmp/vim || {
        echo "mercurial not installed"
        exit
    }
    cd /tmp/vim/src
    ./configure --enable-pythoninterp --enable-rubyinterp
    make
    sudo make install
}

ubuntu_install
clone_repo
ohmyzsh
