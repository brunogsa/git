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

echo "@@@ You probably want to install some Syntax Checkers, so syntastic plugin can really work."
echo "@@@ For more details: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers"
echo "Done!"
