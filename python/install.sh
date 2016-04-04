DOTFILES=$HOME/.dotfiles
ZSHRC=$HOME/.zshrc
OS=$(uname)

ohmyzsh() {
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

    if [ "$OS" = "Darwin" ]; then
        sed -i '' 's/^plugins=(.*)/plugins=(git svn pip osx virtualenvwrapper encode64)/' $ZSHRC
    elif [ "$OS" = "Linux" ]; then
        sed -i '/^plugins/c plugins=(git svn pip virtualenvwrapper encode64)' $ZSHRC
    fi

    sed -i '' 's/^ZSH_THEME=".*"/ZSH_THEME="fox"/' $ZSHRC

    cat $DOTFILES/zsh/zshrc.append >> $HOME/.zshrc

    #ln -sf "$DOTFILES/zsh/custom" "$HOME/.oh-my-zsh/custom"
}

ohmyzsh
