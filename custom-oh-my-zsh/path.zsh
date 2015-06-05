# Local
export PATH=/usr/local/bin:$PATH

# NVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting¬

export NVM_DIR="/Users/jstilwell/.nvm"¬
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 0.10 > /dev/null

# NPM
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=./node_modules/.bin:$PATH

# Tools
export PATH=$PATH:~/tools:~/bin

