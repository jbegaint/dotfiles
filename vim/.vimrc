"-- General
set number
set ruler
set cc=80
set so=7

set autoread
set ttyfast

set listchars=precedes:«,extends:»,eol:↲,tab:▸\ ,trail:.,nbsp:·
set encoding=utf-8
set mouse=a

set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*~,*.pyc
set wildignore+=*.aux,*.dvi,*.bcf,*.blg,*.bbl

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

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

noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l
noremap <M-h> <C-w>h

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>

set statusline=\ %f\ %m%r%h%w%y\ %{GitStatusline()}%=%l\/%-6L\ %3c\ 
set laststatus=2

" -- Plugins
filetype off

call plug#begin()

Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': ['latex', 'tex']}
Plug 'LnL7/vim-nix'
Plug 'Matt-Deacalion/vim-systemd-syntax', {'for': 'systemd'}
Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
Plug 'godlygeek/tabular'
Plug 'mitsuhiko/vim-jinja'
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'petRUShka/vim-opencl', {'for': 'opencl'}
Plug 'posva/vim-vue'
Plug 'tmux-plugins/vim-tmux'

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'chriskempson/base16-shell', {'dir': '~/.config/base16-shell'}
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'klen/python-mode', {'for': 'python'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/BufOnly.vim'

call plug#end()

filetype plugin indent on
syntax on

" -- gui/console look
if has('gui_running')
	set background=dark
	colorscheme base16-ocean
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

" -- Plugins Options

" -- delimitMate
let delimitMate_expand_cr=1

" -- ctrlp
nnoremap <Leader>b :CtrlPBuffer<CR>

" -- BufOnly
nnoremap <Leader>o :BufOnly<CR>

" -- Latex-Box
let g:LatexBox_quickfix = 2
let g:LatexBox_latexmk_preview_continuously = 0
let g:LatexBox_Folding = 1
let g:LatexBox_split_type = 'new'
let g:LatexBox_latexmk_async = 1

" -- The Silver Searcher
if executable('ag')
	" use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" use ag in ctrlp
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -i -g ""'
	let g:ctrlp_use_caching = 1
endif

" -- Python-mode
let g:pymode_doc_bind = ''
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_options_colorcolumn = 1
let g:pymode_rope = 0

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
nnoremap <silent> <F7> :ClangFormat<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
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

" -- dummy function to toggle the status line
function! StatusToggle()
	:let &laststatus = &laststatus == 2 ? 1 : 2
endfunction

function! GitStatusline(...) abort
	" Remove '[Git...]' surrounding the status
	let l:matches = matchlist(fugitive#statusline(), "^\\[Git\\(.*\\)\\]$")
	if len(l:matches) == 0
		return ''
	else
		return l:matches[1]
	endif
endfunction

augroup neomake
	autocmd! BufWritePost * Neomake
augroup END
