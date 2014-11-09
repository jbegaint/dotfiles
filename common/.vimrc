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

Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/context_filetype.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Sorcerer'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'closetag.vim'
Plugin 'freeo/vim-kalisi'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'gundo'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'jordwalke/flatlandia'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'mkitt/tabline.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'petRUShka/vim-opencl'
Plugin 'plasticboy/vim-markdown'
Plugin 'romainl/Apprentice'
Plugin 'romainl/Disciple'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vimwiki/vimwiki'
Plugin 'vivkin/flatland.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'whatyouhide/vim-gotham'

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
	" use term background color
	" hi Normal ctermbg=None
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

" -- vim-airline
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" -- delimitMate
let delimitMate_expand_cr=1

" -- vim-markdown
let g:vim_markdown_folding_disabled=1

" -- ctrlp
let g:ctrlp_custom_ignore = 'git\|venv'
let g:ctrlp_cmd = 'CtrlPMixed'

" -- Latex-Box
let g:LatexBox_quickfix = 2
let g:LatexBox_latexmk_preview_continuously = 1

" -- Pymode
let g:pymode_doc_bind = 'D'
let g:pymode_options_colorcolumn = 0

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

" -- misc shortcuts
" nnoremap <C-Space>		:w <bar> exec '!make' <CR> <CR>

" Fn shortcuts
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :set invnumber<CR>
nnoremap <silent> <F4> :set invlist<CR>
nnoremap <silent> <F5> :GundoToggle<CR>
nnoremap <silent> <F6> :AirlineToggle<CR>
nnoremap <silent> <F7> :call ToggleColours()<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F10> :Gstatus<CR>

" painless navigation in wrapped lines
nnoremap j gj
nnoremap k gk

" swap : and ;
nnoremap ; :
nnoremap : ;

" reload vimrc on the fly
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC |
augroup END

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

" -- Languages specific stuff
autocmd FileType python set sw=4 ts=4 sts=4 tw=0

" misc functions
" function! ToggleColours()
" 	if g:colors_name == 'hybrid'
" 		colorscheme hybrid-light
" 	elseif g:colors_name == 'hybrid-light'
" 		colorscheme hybrid
" 	endif
" endfunction
