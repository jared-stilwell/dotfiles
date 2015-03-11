#!/bin/bash

# Get the path to the current script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# ZSH dotfiles
if [ ! -f ~/.zshrc ]; then
	ln -s $DIR/.zshrc ~/.zshrc
fi

# oh-my-zsh custom files
if [ ! -d ~/.oh-my-zsh/custom ]; then
	ln -s $DIR/custom-oh-my-zsh ~/.oh-my-zsh/custom
fi

# Vim dotfiles
if [ ! -f ~/.vimrc ]; then
	ln -s $DIR/.vimrc ~/.vimrc
fi
