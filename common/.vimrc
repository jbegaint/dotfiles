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
set fo+=wt

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
Bundle 'Raimondi/delimitMate'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'petRUShka/vim-opencl'
" Bundle 'Shougo/neocomplete.vim'
Bundle 'clang_pro.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mkitt/tabline.vim'

call vundle#end()

set t_Co=256
" let base16colorspace=256 
set background=dark

if has('gui_running')
	colorscheme solarized
	set background=light
	let g:airline_theme='solarized'
	set guifont=Source\ Code\ Pro\ 10
	set guioptions-=LlRrb
	set guioptions-=mT
else
	colorscheme wombat256mod
	let g:airline_theme='wombat'
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

" delimitMate
let delimitMate_expand_cr=1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


" insert lines
nnoremap <silent> <S-j> o<ESC>k
nnoremap <silent> <S-k> O<ESC>j

" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" clear search highlight
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <silent> <leader><CR> :noh<CR> 

" reload vimrc on the fly
augroup myvimrc 
	au!  
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | 
augroup END
