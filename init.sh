#!/bin/bash

# Delete old vim stuff
sudo rm -fr ~/.vim
sudo rm -fr /root/.vim

sudo apt-get remove -y vim vim-runtime gvim
sudo apt-get remove -y vim-tiny vim-common vim-gui-common vim-nox

# Install vim dependecies
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

# Install latest vim from source
mkdir -p ~/vim-source
cd ~/vim-source

git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope --prefix=/usr

sudo make install

# Create the proper links
cd ~/vim/

sudo ln -sf ~/vim/.ctags ~/.ctags
sudo ln -sf ~/vim/.tern-project ~/.tern-project
sudo ln -sf ~/vim/.vim ~/.vim
sudo ln -sf ~/vim/.vimrc ~/.vimrc
sudo ln -sf ~/vim/.vim /root/.vim
sudo ln -sf ~/vim/.vimrc /root/.vimrc

# Install / Update the plugins
git submodule init
git submodule update
git submodule update --recursive --remote --merge

sudo apt-get install -y npm
sudo ln -sf /usr/bin/nodejs /usr/bin/node
sudo npm update

cd .vim/bundle/tern_for_vim/
npm install
cd -

sudo npm install -g jsctags

cd .vim/bundle/YouCompleteMe/
git submodule update --init  --recursive
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev
./install.py --tern-completer
cd -

cd .vim/bundle/vim-instant-markdown/
sudo apt-get install -y xdg-utils
sudo npm install -g instant-markdown-d
cd -

# Install any additional lib that we use
sudo apt-get update
sudo apt-get install -y vim-athena
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y libxml2-utils

# Clean any mess
sudo apt autoremove

echo "@@@ You probably want to install some Syntax Checkers, so syntastic plugin can really work."
echo "@@@ For more details: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers"
echo "Done!"
