" Include the base vim configuration
source ~/.vimrc-base

" Plugin manager
source ~/.vimrc-plug

" NERDTree configuration
source ~/.vimrc-nerdtree

" Synstastic configuration
source ~/.vimrc-syntastic

" Language Server Configurations
source ~/.vimrc-intelephense

" Test Runner Support
source ~/.vimrc-test

" Fuzzy matching
source ~/.vimrc-fzf

" Color settings
syntax enable

" Italicized comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
