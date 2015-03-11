syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set backupdir=$HOME/.vim/backup
set cmdheight=2
set directory=$HOME/.vim/tmp
set foldmethod=indent
set nofoldenable
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set nocompatible
set number
set ruler
set scrolloff=2
set showcmd
set showmatch
set smartcase
set smartindent
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set visualbell

filetype plugin indent on

augroup vimrcEx
	autocmd!

	" When editing a file, always jump to the last known cursor position.
	" Don't do it for commit messages, when the position is invalid, or when
	" inside an event handler (happens when dropping a file on gvim).
	autocmd BufReadPost *
		\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
		\		exe "normal g`\"" |
		\ endif
	
	" Set syntax highlighting for specific file types
	autocmd BufRead,BufNewFile *.md set filetype=markdown
	autocmd BufNewFile,BufRead *.es6 set filetype=javascript
	autocmd BufNewFile,BufRead *.php set filetype=php

	" Enable spellchecking for Markdown
	autocmd FileType markdown setlocal spell

	" Automatically wrap at 80 characters for Markdown
	autocmd BufRead,BufNewFile *.md setlocal textwidth=80

	" Automatically wrap at 72 characters and spell check commit messages
	autocmd FileType gitcommit setlocal textwidth=72
	autocmd FileType gitcommit setlocal spell

	" Allow stylesheets to autocomplete hyphenated words
	autocmd FileType css,scss,sass setlocal iskeyword+=-

	" Set tab policy for PHP files
	autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab

augroup END


" CUSTOM KEY COMMANDS

" Wrap text
nmap <leader>w :set wrap!<CR>

" Show invisible characters
nmap <leader>l :set list!<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
" in
" Normal mode: <Leader>t
map <Leader>te :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" Clears trailing whitespace
map <Leader><Space> :%s/\s\+$//<CR>:let @/=''<CR>

