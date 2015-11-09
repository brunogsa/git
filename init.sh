#!/bin/bash
sudo rm -fr ~/.vim
sudo rm -fr /root/.vim
sudo ln -sf ~/vim/.vim ~/.vim
sudo ln -sf ~/vim/.vimrc ~/.vimrc
sudo ln -sf ~/vim/.vim /root/.vim
sudo ln -sf ~/vim/.vimrc /root/.vimrc
git submodule init
git submodule update
cd .vim/bundle/tern_for_vim/
sudo apt-get install -y npm
sudo npm update
sudo npm install
cd -
sudo apt-get update
sudo apt-get install -y vim-athena

echo "@@@ You probably want to install some Syntax Checkers, so syntastic plugin can really work."
echo "@@@ For more details: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers"
echo "Done!"
