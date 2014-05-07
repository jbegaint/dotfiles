"-- General
set number
set ruler
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

set wrap linebreak nolist
set tw=80
set fo+=w

"-- Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

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
Bundle 'tpope/vim-commentary'
Bundle 'plasticboy/vim-markdown'

call vundle#end()

set t_Co=256
" let base16colorspace=256 
set background=dark

if has('gui_running')
	colorscheme base16-monokai
	set guifont=Source\ Code\ Pro\ 10
	set guioptions-=LlRrb
	set guioptions-=mT
else
	" colorscheme base16-mocha
	colorscheme wombat256mod
endif

" https://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
" let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

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
" waiting for the mode color fix
" let g:airline_theme='jellybeans'
let g:airline_theme='wombat'

" insert lines
nnoremap <silent> <S-j> o<ESC>k
nnoremap <silent> <S-k> O<ESC>j
nnoremap <silent> <leader><CR> :noh<CR> 

" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

