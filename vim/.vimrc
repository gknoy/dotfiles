set encoding=utf-8
set paste
set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set incsearch
set ruler
set wildmenu
set commentstring=\ #\ %s
set clipboard=unnamedplus
set hls
set mouse=a
set number
set whichwrap+=<,>,h,l,[,]

syntax on
filetype on
let python_highlight_all=1
map run :w<cr> :!python %<cr>

autocmd BufNewFile,BufRead *.json set ft=javascript

" Show me extra whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

colorscheme twilight256

let &titlestring = expand("%:w") . ": (" . hostname() . ")"
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm" || &term== "xterm-256color"
    set title
endif

