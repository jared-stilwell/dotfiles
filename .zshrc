# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Print system info
archey

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frisk"

# Enable italics within iTerm
TERM=xterm-256color-italic

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(hosts)

# Initialize Oh my zsh!
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin

# added by travis gem
[ -f /Users/jstilwell/.travis/travis.sh ] && source /Users/jstilwell/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
