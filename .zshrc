#--------------------------------------------------------------------------
# Oh My Zsh
#--------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
	docker
	docker-compose
	git
	z
)

source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------
export ARTISAN_OPEN_ON_MAKE_EDITOR=vim
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_COMMAND='ag --ignore ./node_modules -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && . "$NVM_DIR/bash_completion.d/nvm"

#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias a='artisan'
alias cdomz='cd ~/.oh-my-zsh/custom'
alias pref='vim ~/.zshrc'
alias repref='. ~/.zshrc'
alias cdpro='cd ~/projects'
alias gcm='git commit'
alias gco='git checkout'
alias gs='git status'
alias gas='git add . && git status'
alias scm='git commit --no-verify -m "safety commit."'

#--------------------------------------------------------------------------
# Paths
#--------------------------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/.composer/vendor/laravel/installer/bin
export PATH=$PATH:~/.composer/vendor/laravel/pint/builds
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=./node_modules/.bin:$PATH
export PATH=$PATH:~/projects/retailmenot-release-tools/jobshell
export PATH=$PATH:~/scripts
export PATH=/usr/local/opt/node@16/bin:$PATH

#--------------------------------------------------------------------------
# Utilities
#--------------------------------------------------------------------------

# Add gnuplot support to kitty terminal emulator
function iplot {
    cat <<EOF | gnuplot | kitty +kitten icat --stdin yes
    set terminal pngcairo enhanced font 'Operator Mono Lig,14'
    set autoscale
    set samples 1000
    set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#fdf6e3" behind
    plot $@
EOF
}

function laranew {
    composer create-project laravel/laravel ${1}
}
