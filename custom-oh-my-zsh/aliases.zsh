function repref() {
  source ~/.zshrc
}

# General
alias ll='ls -la'
alias ..='cd ..';
alias ...='cd ../..';

# ZSH
alias cdomz='cd ~/.oh-my-zsh/custom'
alias pref='vim ~/.zshrc'
alias pref-alias='vim ~/.oh-my-zsh/custom/aliases.zsh'
alias pref-func='vim ~/.oh-my-zsh/custom/func.zsh'
alias pref-path='vim ~/.oh-my-zsh/custom/path.zsh'

# Projects
alias cdpro='cd ~/projects'

# Git
alias gcm='git commit'
alias gco='git checkout'
alias gfix='git add . && git commit --amend'
alias glg='git lg'
alias gs='git status'
alias gas='git add . && git status'
alias gdc='git diff --color-words'
alias scm='git commit --no-verify -m "safety commit."'
alias rmorig='rm -rf **/*.orig'

# Docker
alias drm='docker rm'
alias drmi='docker rmi'
alias drma='docker rm $(docker ps -a -q)'
alias drmia='docker rmi $(docker images -q)'
alias dclean='drma && drmia'

# Karma
alias ksp='karma start --browsers=PhantomJS'
alias ksc='karma start --browsers=Chrome'

# Node
alias npmclean='rm -rf node_modules && npm install'

# Web Server
alias webserver='python -m SimpleHTTPServer'

