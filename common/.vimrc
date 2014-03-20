"-- General
set number
set ruler
hi ColorColumn ctermbg=darkblue guibg=lightblue
set cc=80
set so=7

set autoread

" Leader
let mapleader = ","
nmap <leader>w :w!<cr>

syntax on
set encoding=utf-8

set wildmenu
set wildignore=*.o,*~,*.pyc

set autoindent
set smartindent

set noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4

set hlsearch 
set ignorecase
set incsearch
set smartcase

set backspace=indent,eol,start
set hidden

set nobackup
set nowb
set noswapfile

set wrap
set lbr
set tw=80
" Theme
set background=dark

set nofoldenable

"-- Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'chriskempson/base16-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jcf/vim-latex'
Bundle 'Townk/vim-autoclose'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'

let base16colorspace=256 
colorscheme base16-tomorrow

filetype plugin indent on

"vim-latex settings
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf="zathura"

"-- Shortcuts
" NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F2> <ESC>:NERDTreeToggle<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='tomorrow'

" insert lines
nmap <silent> <C-Enter> O<ESC>j
map <silent> <S-Enter> o<ESC>k
nmap <silent> <leader><CR> :noh<CR> 
