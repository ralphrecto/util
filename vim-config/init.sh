#!/bin/bash

cp ./.vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/Lokaltog/vim-easymotion
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/tomasr/molokai
git clone https://github.com/bling/vim-airline
git clone https://github.com/terryma/vim-multiple-cursors
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/nerdcommenter

