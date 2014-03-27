"-- General
set number
set ruler
hi ColorColumn ctermbg=lightblue guibg=lightblue
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
"set background=dark

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

set t_Co=256
let base16colorspace=256 

if has('gui_running')
	colorscheme base16-solarized	
	set background=light
else
	colorscheme base16-tomorrow
	set background=dark
endif

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
let g:airline_theme='jellybeans'

" insert lines
nnoremap <silent> <S-j> o<ESC>k
nnoremap <silent> <S-k> O<ESC>j
nnoremap <silent> <leader><CR> :noh<CR> 

"-- GUI stuff
if has("gui_running")
	set guifont=Source\ Code\ Pro\ 10
endif
