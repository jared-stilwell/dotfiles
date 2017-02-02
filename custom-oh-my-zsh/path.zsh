# Local
export PATH=/usr/local/bin:$PATH

# NVM
export NVM_DIR="/Users/jstilwell/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# NPM
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=./node_modules/.bin:$PATH

# Tools
export PATH=$PATH:~/tools:~/bin

## Set ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --ignore ./node_modules -g ""'

# Python virtualenvwrapper paths
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh
