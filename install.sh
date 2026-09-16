#!/bin/bash

# Get the path to the current script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function install() {
	if [ ! -e "$2" ]; then
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

# Git config
install $DIR/gitconfig ~/.gitconfig

# Personal scripts
cp -R $DIR/scripts ~/scripts

# oh-my-zsh custom files
rm -rf ~/.oh-my-zsh/custom
install $DIR/custom-oh-my-zsh ~/.oh-my-zsh/custom

# Add term info to allow italics to work
tic xterm-256color-italic.terminfo

# Neovim (lua-based config)
mkdir -p $HOME/.config
ln -fs $DIR/nvim $HOME/.config/nvim

# Kitty terminal
ln -fs $DIR/kitty $HOME/.config/kitty

# Fonts
mkdir -p $HOME/Library/Fonts
cp $DIR/fonts/Glass_TTY_VT220.ttf $HOME/Library/Fonts/ 2>/dev/null || true
# Linux fallback
if [ "$(uname)" = "Linux" ]; then
	mkdir -p $HOME/.local/share/fonts
	cp $DIR/fonts/Glass_TTY_VT220.ttf $HOME/.local/share/fonts/
	fc-cache -f 2>/dev/null || true
fi

# Legacy Vim dotfiles (kept for reference)
mkdir -p $HOME/.vim/backup
install $DIR/.vimrc ~/.vimrc
install $DIR/.vimrc-base ~/.vimrc-base
install $DIR/.vimrc-plug ~/.vimrc-plug
install $DIR/.vimrc-nerdtree ~/.vimrc-nerdtree
install $DIR/.vimrc-syntastic ~/.vimrc-syntastic
install $DIR/.vimrc-fzf ~/.vimrc-fzf
install $DIR/.vimrc-intelephense ~/.vimrc-intelephense
install $DIR/.vimrc-test ~/.vimrc-test

## vim-plug plugin manager
rm -rf ~/.vim/autoload
mkdir -p ~/.vim/autoload
install $DIR/link/vim-plug/plug.vim ~/.vim/autoload/plug.vim
