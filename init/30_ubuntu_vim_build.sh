# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

e_header "Installing compilation prerequisites."
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev mercurial checkinstall

e_header "Removing old vim installs."
sudo apt-get remove vim vim-runtime gvim
sudo apt-get remove vim-tiny vim-common vim-gui-common

e_header "Cloning VIM repository."
cd ~
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74

e_header "Compiling and installing."
sudo checkinstall

e_header "Setting defaults to GVIM."
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/gvim 1
sudo update-alternatives --set editor /usr/bin/gvim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/gvim 1
sudo update-alternatives --set vi /usr/bin/gvim

e_header "Setting up Vundle."
mkdir -p $DOTFILES/link/.vim/bundle/
ln -s $DOTFILES/vendor/Vundle.vim $DOTFILES/link/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
