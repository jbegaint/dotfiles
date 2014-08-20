"-- General
set number
set ruler
set cc=80
set so=7

set autoread

" Leader
let mapleader = ","
nmap <leader>w :w!<cr>

map j gj
map k gk

syntax on

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

set wrap linebreak nolist
set tw=80
set fo+=wt
set nofoldenable
set modeline

set complete+=kspell


"-- Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/context_filetype.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'chriskempson/base16-vim'
Bundle 'gmarik/vundle'
Bundle 'jcf/vim-latex'
Bundle 'kien/ctrlp.vim'
Bundle 'mkitt/tabline.vim'
Bundle 'petRUShka/vim-opencl'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/seoul256.vim'
Bundle 'github-theme'
Bundle 'pyte'
Bundle 'xoria256.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'mitsuhiko/fruity-vim-colorscheme'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'vydark'
Bundle 'vylight'
Bundle 'cleanroom'
Bundle 'gundo'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'vivkin/flatland.vim'
Bundle 'jordwalke/flatlandia'
Bundle 'zeis/vim-kolor'
Bundle 'PotatoesMaster/i3-vim-syntax'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'w0ng/vim-hybrid'
Bundle 'mhinz/vim-startify'
Bundle 'jellybeans.vim'

call vundle#end()

if has('gui_running')
	colorscheme flatland
	set background=dark
	let g:airline_theme='flatlandia'
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

	% "standard" editor shortcuts
	nnoremap <C-tab> :tabnext <CR>
	nnoremap <C-S-tab> :tabprevious <CR>
	inoremap <C-BS> <C-w>
else
	set t_Co=256
	colorscheme Tomorrow-Night
	set background=dark
	let g:airline_theme='tomorrow'
endif

" https://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
" let &colorcolumn=join(range(81,999),",")
" let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

filetype plugin indent on


" ------ Plugins options and shortcuts ------

" -- Neocomplete
let g:neocomplete#use_vimproc = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#sources#syntax#min_keyword_length = 2
set completeopt-=preview

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" delimitMate and neocomplete compatibility
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" -- vim-latex settings
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf="zathura"
let g:tex_flavor='latex'

" -- NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F2> <ESC>:NERDTreeToggle<CR>

" -- Gundo
nnoremap <F4> :GundoToggle<CR>

" -- vim-airline
set laststatus=2
let g:airline_powerline_fonts=1

" -- delimitMate
let delimitMate_expand_cr=1

" -- Goyo
nnoremap <Leader><Space> :Goyo<CR>

" -- vim-fugitive
nnoremap <F10> :Gstatus<CR>

" -- vim-session
" let g:session_autoload="no"
" let g:session_autosave="yes"

" -- vim-markdown
let g:vim_markdown_folding_disabled=1

" -- startify
" let g:startify_session_persistence = 1

" -- vim-session
let g:session_autosave = "yes"
" let g:session_autoload = "yes"

" ------ misc shortcuts/ options ------

" insert lines
nnoremap <silent> <S-j> o<ESC>k
nnoremap <silent> <S-k> O<ESC>j

nnoremap Q		<nop>
nmap <F1> 	<nop>

" clear search highlight
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <silent> <leader><CR> :noh<CR> 

" reload vimrc on the fly
augroup myvimrc 
	au!  
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | 
augroup END

" timeout for ESC
set timeoutlen=1000 ttimeoutlen=0

nnoremap <C-Space>		:w <bar> exec '!make' <CR> <CR>

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
