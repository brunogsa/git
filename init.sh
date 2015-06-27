#!/bin/bash
sudo rm -fr ~/.vim
ln -sf ~/vim/.vim ~/.vim
ln -sf ~/vim/.vimrc ~/.vimrc
git submodule init
git submodule update
echo "Done"
