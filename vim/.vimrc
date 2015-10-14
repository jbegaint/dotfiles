"-- General
set number
set ruler
set cc=80
set so=7

set autoread
set ttyfast

set listchars=precedes:«,extends:»,eol:↲,tab:▸\ ,trail:.
set encoding=utf-8
set mouse=a

set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*~,*.pyc
set wildignore+=*.aux,*.dvi,*.bcf,*.blg,*.bbl

set autoindent
set smartindent

set noexpandtab
set smarttab
set shiftwidth=8
set tabstop=8
set softtabstop=8

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
set ttimeout
set ttimeoutlen=100

set splitright
set splitbelow

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

nnoremap <Leader><Space> za
nnoremap <CR> :noh<CR><CR>

nnoremap <Leader>c :bp\|bd #<CR>

nnoremap <silent> <S-j> o<ESC>k
nnoremap <silent> <S-k> O<ESC>j

nnoremap <silent><S-Tab> :bprev<CR>
nnoremap <silent><Tab> :bnext<CR>

nnoremap j gj
nnoremap k gk

" nnoremap ; :
" nnoremap : ;

noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l
noremap <M-h> <C-w>h

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>

set statusline=\ \%f%m%r%h%w\ ::\ %y\ \%{exists('*fugitive#head')?fugitive#head():''}\ %=\ %{&ff}\|%{strlen(&fenc)?&fenc:'none'}\%5.c\ [%p%%:\ %l/%L]\ 
set laststatus=2

" -- Plugins
filetype off

call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'docunext/closetag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango']}
Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': ['latex', 'tex']}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rsi'
Plug 'Matt-Deacalion/vim-systemd-syntax', {'for': 'systemd'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': ['mkd', 'mkd.markdown']}
Plug 'DanielFGray/DistractionFree.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'chriskempson/base16-shell', {'dir': '~/.config/base16-shell'}
Plug 'chriskempson/base16-xresources', {'dir': '~/.config/base16-xresources'}
Plug 'raichoo/haskell-vim', {'for': 'haskell'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'haya14busa/incsearch.vim'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vimwiki/vimwiki'
Plug 'petRUShka/vim-opencl'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ap/vim-buftabline'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'klen/python-mode'
call plug#end()

filetype plugin indent on
syntax on

" -- gui/console look
if has('gui_running')
	set background=dark
	colorscheme base16-tomorrow
	set guifont=Source\ Code\ Pro\ Medium\ 10

	" remove menu, toolbar, and scrollbars
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L

	" use console-like tabs
	set guioptions-=e
	" use console dialogs
	set guioptions+=c

	inoremap <C-BS> <C-W>
else
	set t_Co=256
	set background=dark
	let base16colorspace=256
	colorscheme base16-tomorrow
endif

" color right border after 80 chars (and background after 100)
let &colorcolumn=join(range(80,999),",")
let &colorcolumn="80,".join(range(100,999),",")
highlight ColorColumn ctermbg=236 guibg=#2c2d27

" ------ Plugins options and shortcuts ------

" " -- Neocomplete
let g:neocomplete#use_vimproc = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#sources#syntax#min_keyword_length = 3
set completeopt-=preview

" -- delimitMate
let delimitMate_expand_cr=1

" -- vim-markdown
let g:vim_markdown_folding_disabled=1

" -- ctrlp
nnoremap <Leader>b :CtrlPBuffer<CR>

" -- BufOnly
nnoremap <Leader>o :BufOnly<CR>

" -- Latex-Box
let g:LatexBox_quickfix = 4
let g:LatexBox_latexmk_preview_continuously = 0
let g:LatexBox_Folding = 1
let g:LatexBox_split_type = 'new'
let g:LatexBox_latexmk_async = 1

" -- The Silver Searcher
if executable('ag')
	" use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" use ag in ctrlp
	let g:ctrlp_user_command = 'ag %s -l --nocolor -i
				\ --ignore "*.o"
				\ --ignore "*.pyc"
				\ --ignore "*.git"
				\ --ignore "*.svn"
				\ --ignore venv
				\ --ignore venv2
				\ --ignore staticfiles
				\ -g ""'
	let g:ctrlp_use_caching = 1
endif

" -- Python-mode
let g:pymode_options_colorcolumn = 1
let g:pymode_doc_bind = ''
let g:pymode_rope = 0
let g:pymode_lint = 0

" -- Syntastic
let g:syntastic_python_flake8_args = '--ignore=W191,E128,E501'

" -- vim-session
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

" -- UltiSnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" -- NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$', 'venv*']

" -- buftabline
let g:buftabline_show = 1

" -- vimwiki
let vimwiki_html_path = '~/.vimwiki/export/html/'
let g:vimwiki_list = [{
			\ 'path': '~/.vimwiki/wiki',
			\ 'path_html': vimwiki_html_path,
			\ 'auto_export': 1,
			\ 'template_path': vimwiki_html_path.'assets/',
			\ 'template_default': 'default',
			\ 'template_ext': '.tpl',
			\ }]

" -- quick-scope
" https://gist.github.com/cszentkiralyi/dc61ee28ab81d23a67aa
let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

for i in g:qs_enable_char_list
	execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

" -- misc shortcuts and options
" Fn shortcuts
nnoremap <silent> <F1> mmgqip`m
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :set invnumber<CR>
nnoremap <silent> <F4> :set invlist<CR>
nnoremap <silent> <F5> :call StatusToggle()<CR>
nnoremap <silent> <F6> :SyntasticToggleMode<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F11> :call FillLine( '-' )<CR>
set pastetoggle=<F12>

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

" -- fill rest of line with characters
" see: https://stackoverflow.com/questions/3364102/how-to-fill-a-line-with-character-x-up-to-column-y-using-vim
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    let offset = 2
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$") - offset) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

" -- dummy function to toggle the status line
function! StatusToggle()
	:let &laststatus = &laststatus == 2 ? 1 : 2
endfunction

let g:vimwiki_list = [{'path':'~/.vimwiki/wiki', 'path_html':'~/.vimwiki/export/html/', 'auto_export':1}]
