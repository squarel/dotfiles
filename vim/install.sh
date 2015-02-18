
vim_install() {
    # compile from scratch
    #sudo apt-get -y remove vim-common vim-runtime
    #sudo apt-get -y build-dep vim
    hash hg > /dev/null && /usr/bin/env hg clone https://vim.googlecode.com/hg/ /tmp/vim || {
        echo "mercurial not installed"
        exit
    }
    cd /tmp/vim/src
    ./configure --enable-pythoninterp --enable-rubyinterp
    make
    sudo make install
}


vim_install
