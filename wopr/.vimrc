"-- General
set number
set nocompatible
set columns=80
set ruler
syntax on

set encoding=utf8

set autoindent
set smartindent

set noexpandtab
set shiftwidth=4
set tabstop=4

set hlsearch 
set ignorecase
set incsearch

set backspace=indent,eol,start
set hidden

set nobackup
set nowb
set noswapfile

set wrap

set background=dark

set nofoldenable

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'chriskempson/base16-vim'
Bundle 'jcf/vim-latex'
"Bundle 'bling/vim-airline'
Bundle 'Townk/vim-autoclose'

filetype plugin indent on

"powerline
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = "base16"

"vim-latex settings
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf="zathura"
