#!/bin/bash

# Get the path to the current script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function install() {
	if [ ! -f "$2" ]; then
		ln -s "$1" "$2"
	fi
}

# ZSH dotfiles
install $DIR/.zshrc ~/.zshrc

# oh-my-zsh custom files
rm -rf ~/.oh-my-zsh/custom
install $DIR/custom-oh-my-zsh ~/.oh-my-zsh/custom

# Vim dotfiles
install $DIR/.vimrc ~/.vimrc
install $DIR/.vimrc-base ~/.vimrc-base

rm -rf ~/.vim/autoload
mkdir -p ~/.vim/autoload
install $DIR/.vim/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

