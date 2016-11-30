" Include the base vim configuration
source ~/.vimrc-base

" Plugin manager
source ~/.vimrc-plug

" NERDTree configuration
source ~/.vimrc-nerdtree

" Synstastic configuration
source ~/.vimrc-syntastic

" Fuzzy matching
source ~/.vimrc-fzf

" Solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" Italicized comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

