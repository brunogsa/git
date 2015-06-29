#!/bin/bash
sudo rm -fr ~/.vim
ln -sf ~/vim/.vim ~/.vim
ln -sf ~/vim/.vimrc ~/.vimrc
git submodule init
git submodule update
cd .vim/bundle/tern_for_vim/
sudo npm update
sudo npm install
cd -
echo "Done"
