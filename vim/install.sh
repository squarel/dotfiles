
vim_install() {
    # compile from scratch
    #sudo apt-get -y remove vim-common vim-runtime
    #sudo apt-get -y build-dep vim
    hash git > /dev/null && /usr/bin/env git clone https://github.com/vim/vim.git /tmp/vim || {
        echo "git not installed"
        exit
    }
    cd /tmp/vim/src
    ./configure --enable-pythoninterp --enable-rubyinterp
    make
    sudo make install
}


vim_install
