
# TODO: install based on distribution, no need to compile for OSX
vim_install() {
    # compile from scratch
    #sudo apt-get -y remove vim-common vim-runtime
    #sudo apt-get -y build-dep vim
    sudo yum install ncurses ncurses-devel
    git clone https://github.com/vim/vim.git /tmp/vim
    cd /tmp/vim
    ./configure --enable-pythoninterp --enable-rubyinterp --enable-luainterp --with-features=huge
    make
    sudo make install

}

spf13() {
    curl http://j.mp/spf13-vim3 -L -o - | sh
}

vim_install
spf13
