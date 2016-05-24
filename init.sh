#!/bin/bash
sudo rm -fr ~/.vim
sudo rm -fr /root/.vim
sudo ln -sf ~/vim/.ctags ~/.ctags
sudo ln -sf ~/vim/.vim ~/.vim
sudo ln -sf ~/vim/.vimrc ~/.vimrc
sudo ln -sf ~/vim/.vim /root/.vim
sudo ln -sf ~/vim/.vimrc /root/.vimrc
git submodule init
git submodule update
cd .vim/bundle/tern_for_vim/
sudo apt-get install -y npm
sudo npm update
npm install
#cd .vim/bundle/YouCompleteMe/
#git submodule update --init  --recursive
#sudo apt-get install -y build-essential cmake
#sudo apt-get install -y python-dev python3-dev
#./install.py --tern-completer
cd -
sudo apt-get update
sudo apt-get install -y vim-athena
sudo apt-get install -y exuberant-ctags

echo "@@@ You probably want to install some Syntax Checkers, so syntastic plugin can really work."
echo "@@@ For more details: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers"
echo "Done!"
