#!/bin/bash
sudo rm -fr ~/.vim
ln -sf ~/vim/.vim ~/.vim
ln -sf ~/vim/.vimrc ~/.vimrc
git submodule foreach git pull
echo "Done"
