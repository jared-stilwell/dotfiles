#!/bin/bash

# Get the path to the current script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function install() {
	if [ ! -f "$2" ]; then
		ln -s "$1" "$2"
	fi
}

function install_vim_plugin() {
	rm -f ~/.vim/bundle/$1
	ln -s $DIR/link/$1 ~/.vim/bundle/$1
}

# NOTE: This doesn't pull updates from each module's remote
git submodule update

# ZSH dotfiles
install $DIR/.zshrc ~/.zshrc

# oh-my-zsh custom files
rm -rf ~/.oh-my-zsh/custom
install $DIR/custom-oh-my-zsh ~/.oh-my-zsh/custom

# Vim dotfiles
install $DIR/.vimrc ~/.vimrc
install $DIR/.vimrc-base ~/.vimrc-base
install $DIR/.vimrc-nerdtree ~/.vimrc-nerdtree
install $DIR/.vimrc-syntastic ~/.vimrc-syntastic
install $DIR/.vimrc-airline ~/.vimrc-airline

# Neovim mapping
mkdir -p $HOME/.config
ln -fs ~/.vim $HOME/.config/nvim
ln -fs ~/.vimrc $HOME/.config/nvim/init.vim
ln -fs ~/.vimrc-base $HOME/.config/nvim/.vimrc-base
ln -fs ~/.vimrc-airline $HOME/.config/nvim/.vimrc-airline
ln -fs ~/.vimrc-nerdtree $HOME/.config/nvim/.vimrc-nerdtree
ln -fs ~/.vimrc-syntastic $HOME/.config/nvim/.vimrc-syntastic

## Pathogen
rm -rf ~/.vim/autoload
mkdir -p ~/.vim/autoload
install $DIR/link/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

## Vim Plugins
install_vim_plugin nerdtree
install_vim_plugin syntastic
install_vim_plugin vim-airline
install_vim_plugin vim-airline-themes
install_vim_plugin editorconfig-vim
install_vim_plugin vim-polyglot
install_vim_plugin scss-syntax

# Editor Config
install $DIR/.editorconfig ~/.editorconfig

