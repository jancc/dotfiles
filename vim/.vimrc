set encoding=utf-8
scriptencoding utf-8

" default indenting behaviour
" tab = 4 spaces
" spaces for indentation
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set mouse=a
set ttymouse=sgr
set scrolloff=5

" show invisible characters
set list
set listchars=tab:»-,trail:~,extends:»,precedes:«,nbsp:⣿

" syntax hightlighting
syntax on

" line numbers
set number
set relativenumber

" maintain undo history
set undofile
set undodir=~/.vim/undo
set noswapfile

" no startup message
set shortmess+=I

" highlight search
:set hlsearch
:set incsearch

" plugins
call plug#begin('~/.vim/plugged')

Plug 'valloric/youcompleteme'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'fatih/vim-go'

call plug#end()

" nerdtree autostart on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" nice colors
syntax enable
" molokai
colorscheme molokai
let g:molokai_original=1
" solarized
"colorscheme solarized
"set background=light
"let g:solarized_termtrans=0
"let g:solarized_visibility='high'

" transparent background
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

" column at x characters
set colorcolumn=80

" sexy statusline
set laststatus=2
set statusline=\ %n:\ %<%f\ %#StatusLineNC#\ %H%M%R%=%b=0x%B\ \|\ %cx%l%V\ \|\ %p%%\ 

" vimtex
let g:vimtex_compiler_latexmk = { 
\ 'executable' : 'latexmk',
\ 'options' : [ 
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}
let g:vimtex_view_method = 'mupdf'
let g:tex_flavor = 'latex'
