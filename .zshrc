PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    echo "Profiling startup time..."
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>/tmp/startlog.$$
    setopt xtrace prompt_subst
fi

# Enable italics within iTerm
TERM=xterm-256color-italic

# Initialize oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jared"
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ "$PROFILE_STARTUP" == true ]]; then
    echo "Done profiling startup time."
    unsetopt xtrace
    exec 2>&3 3>&-
fi

export PATH="$HOME/.yarn/bin:$PATH"
