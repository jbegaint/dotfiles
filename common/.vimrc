"-- General
set number
set ruler
set cc=80
set so=7

set autoread
set ttyfast

" Leader
let mapleader = ","
nmap <leader>w :w!<cr>

map j gj
map k gk

syntax on

set listchars=precedes:«,extends:»,eol:↲,tab:▸\ ,trail:.
set encoding=utf-8
set mouse=a

set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*.aux,*.dvi,*.bcf,*.blg,*.bbl

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

set wrap linebreak
set tw=80
set fo+=wt
set nofoldenable
set modeline

set complete+=kspell

" -- Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Bundle 'PotatoesMaster/i3-vim-syntax'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/context_filetype.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'  
Bundle 'gundo'
Bundle 'jcf/vim-latex'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'jordwalke/flatlandia'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-startify'
Bundle 'mkitt/tabline.vim'
Bundle 'petRUShka/vim-opencl'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-surround'
Bundle 'vivkin/flatland.vim'

call vundle#end()
filetype plugin indent on

" -- gui/console look
if has('gui_running')
	set background=dark
	colorscheme Tomorrow-Night
	let g:airline_theme='tomorrow'
	set guifont=Source\ Code\ Pro\ 10

	" remove menu, toolbar, and srcollbars
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L

	" use console-like tabs
	set guioptions-=e
	" use console dialogs
	set guioptions+=c

	" standard editor shortcuts
	nnoremap <C-tab> :tabnext <CR>
	nnoremap <C-S-tab> :tabprevious <CR>
	inoremap <C-BS> <C-w>
else
	set t_Co=256
	set background=dark
	colorscheme Tomorrow-Night
	hi Normal ctermbg=234
	let g:airline_theme='tomorrow'
endif

" color right border after 80 chars (and background after 100)
let &colorcolumn=join(range(80,999),",")
let &colorcolumn="80,".join(range(100,999),",")
highlight ColorColumn ctermbg=236 guibg=#2c2d27

" ------ Plugins options and shortcuts ------

" -- Neocomplete
let g:neocomplete#use_vimproc = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_auto_select = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
set completeopt-=preview

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" -- delimitMate and neocomplete compatibility
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" -- vim-latex settings
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf="zathura"
let g:tex_flavor='latex'

" -- NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F2> <ESC>:NERDTreeToggle<CR>

" -- Gundo
nnoremap <F5> :GundoToggle<CR>

" -- vim-airline
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tab_nr_type = 1	" display tab number

" -- delimitMate
let delimitMate_expand_cr=1

" -- vim-fugitive
nnoremap <F10> :Gstatus<CR>

" -- vim-markdown
let g:vim_markdown_folding_disabled=1

" -- ctrlp
let g:ctrlp_custom_ignore = 'git\|venv'

" ------ misc shortcuts/ options ------

" insert lines
nnoremap <silent> <S-j> o<ESC>k
nnoremap <silent> <S-k> O<ESC>j

" clear search highlight
nnoremap <CR> :noh<CR><CR>
nnoremap <silent> <leader><CR> :noh<CR>

" disable hex mode and help shortcuts
nnoremap Q		<nop>
nmap 	<F1> 	<nop>

" misc shortcuts
" nnoremap <C-Space>		:w <bar> exec '!make' <CR> <CR>
nnoremap <silent> <F3> :set invnumber<CR>
nnoremap <silent> <F4> :set invlist<CR>
nnoremap <silent> <F6> :AirlineToggle<CR>

" reload vimrc on the fly
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC |
augroup END

" timeout for ESC
set timeoutlen=1000 ttimeoutlen=0

" -- highlight current line number
" 1. clear highlight
set cursorline
hi clear CursorLine
augroup CLClear
	autocmd! ColorScheme * hi clear CursorLine
augroup END
" 2. set highlight for CursorLineNR
hi CursorLineNr cterm=bold
augroup CLNRSet
	autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

"-- Languages specific stuff
autocmd FileType python set sw=4 ts=4 sts=4
