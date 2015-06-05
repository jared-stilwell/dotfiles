# General
alias ll='ls -la'
alias ..='cd ..';
alias ...='cd ../..';
alias cdtools='cd ~/tools'

# Task Notification
function tn() {
	terminal-notifier \
		-message $1 \
		-execute ${2:=""} \
		-title ${3:="Task Complete"} \
		-sound ${4:=default} 
}

# ZSH
alias pref='vim ~/.zshrc'
alias pref-alias='vim ~/.oh-my-zsh/custom/aliases.zsh'
alias pref-func='vim ~/.oh-my-zsh/custom/func.zsh'
alias pref-path='vim ~/.oh-my-zsh/custom/path.zsh'
alias cdomz='cd ~/.oh-my-zsh/custom'

function repref() {
  source ~/.zshrc
}

# Atom
alias atom='open -a /Applications/Atom.app'

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
alias rmbranch='git branch -d'
alias gitpeek='git show-branch --sha1-name'
alias gtop='git rev-parse HEAD | pbcopy'
alias rmorig='rm -rf **/*.orig'
alias rmnclean='for k in $(git branch -l | grep "^ *RMN-"); do git branch -D $k;done';
alias relclean='for k in $(git branch -l | grep "^ *[0-9][0-9]\.[0-9][0-9]"); do git branch -D $k;done';

# Docker
alias b2d='boot2docker'
alias drm='docker rm'
alias drmi='docker rmi'
alias drma='docker rm $(docker ps -a -q)'
alias drmia='docker rmi $(docker images -q)'
alias dclean='drma && drmia'

# Karma
alias ksp='karma start --browsers=PhantomJS'
alias ksc='karma start --browsers=Chrome'

# DNS
function kickdns() {
  sudo launchctl stop com.apple.mDNSResponderHelper;
  sudo launchctl stop com.apple.mDNSResponder;

  sudo launchctl start com.apple.mDNSResponderHelper;
  sudo launchctl start com.apple.mDNSResponder;
}

# Python
alias mkve='mkvirtualenv -p /usr/local/bin/python2.7'

# Go
alias cdgopath='cd $GOPATH'
alias cdgo='cd $GOPATH/src/github.com/jared-stilwell'

# Node
alias npmclean='rm -rf node_modules && npm install'
function nodedebug() {
  supervisor -i . -x node-inspector .
}

function nodeunitdebug() {
  supervisor --debug-brk -- `which nodeunit` $1 & 2>&1 > /dev/null
}

# Vim
alias viprefs='vim ~/.vimrc'

# WebDriver
alias webdriver='java -jar ~/tools/webdriver/selenium-server-standalone-2.33.0.jar'

# Web Server
alias webserver='python -m SimpleHTTPServer'

