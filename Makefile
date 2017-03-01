DIR=$(shell cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
HOMEDIR=$(shell echo $(HOME))
DOTS=.zshrc
DOTFILES=$(foreach file,$(DOTS),$(HOMEDIR)/$(file))

VIMCONFIGFILES=.vimrc .vimrc-base .vimrc-fzf .vimrc-nerdtree .vimrc-plug .vimrc-syntastic
VIMCONFIGS=$(foreach file,$(VIMCONFIGFILES),$(HOMEDIR)/$(file))
VIMPLUG=$(HOMEDIR)/.vim/autoload/plug.vim
VIMCOLORS=$(HOMEDIR)/.vim/colors/solarized.vim
VIM=$(VIMCONFIGS) $(VIMCOLORS) $(VIMPLUG)

##
## LITERALLY EVERYTHING
##
all: $(DOTFILES) $(VIM)

# Dotfiles
$(HOMEDIR)/.%:
	ln -s $(DIR)/$(notdir $@) $(HOMEDIR)/$(notdir $@)

# Neovim Mapping
$(HOMEDIR)/.config: $(VIMCONFIGS)
	mkdir -p $(HOMEDIR)/.config
	ln -fs $(HOMEDIR)/.vim $(HOMEDIR)/.config/nvim
	ln -fs $(HOMEDIR)/.vimrc $(HOMEDIR)/.config/nvim/init.vim
	ln -fs $(HOMEDIR)/.

# VIM Color Scheme
$(VIMCOLORS):
	mkdir -p $(dir $(VIMCOLORS))
	ln -s $(DIR)/link/solarized/vim-colors-solarized/colors/solarized.vim $(VIMCOLORS)
	tic xterm-256color-italic.terminfo

# VIM Plugin Manager
$(VIMPLUG):
	mkdir -p $(dir $(VIMPLUG))
	ln -s $(DIR)/link/vim-plug/plug.vim $(VIMPLUG)

##
## Clean Up
##
clean:
	rm -f $(DOTFILES)
	rm -f $(VIM)
	rm -rf $(dir $(VIMPLUG))
	rm -f $(HOMEDIR)/.zsh_history
	rm -f $(HOMEDIR)/.zsh-update
