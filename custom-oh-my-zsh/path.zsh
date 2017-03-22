# Local
export PATH=/usr/local/bin:$PATH

# NVM
export NVM_DIR="/Users/jstilwell/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm without selecting a version

# NPM
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=./node_modules/.bin:$PATH

# Tools
export PATH=$PATH:~/tools:~/bin
export PATH=$PATH:/usr/local/opt/llvm/bin

## Set ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --ignore ./node_modules -g ""'
