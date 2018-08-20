" -- General
set number
set ruler
set cc=80
set so=7

set autoread

if has("patch-7.4.710")
	set listchars=precedes:«,extends:»,eol:↲,tab:▸\ ,trail:.,nbsp:·,space:␣
else
	set listchars=precedes:«,extends:»,eol:↲,tab:▸\ ,trail:.,nbsp:·
endif

set encoding=utf-8
set mouse=a

set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*~,*.pyc,*.aux,*.dvi,*.bcf,*.blg,*.bbl,*egg-info

set autoindent
" set smartindent

set shiftwidth=0
set softtabstop=-1
set tabstop=4
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

" -- Mappings
nnoremap <CR> :noh<CR><CR>

nnoremap <Leader><Leader> :ls<CR>:b<Space>
nnoremap <Leader>b :ls<CR>:buffer<Space>
nnoremap <Leader>B :ls<CR>:sbuffer<Space>
" nnoremap <Leader>l :b#<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>c :bp\|bd #<CR>
nnoremap <Leader>s mmvip:sort<CR>`m

nnoremap <Leader>t :Start! ctags -R<CR>

nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>ep :e ~/.plan/plan.md<CR>

nnoremap <silent><S-j> o<ESC>k
nnoremap <silent><S-k> O<ESC>j

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

nnoremap <silent><F1> mmgqip`m
nnoremap <silent><F9> mmgqip`m
nnoremap <silent><F3> :set invnumber<CR>
nnoremap <silent><F4> :set invlist<CR>
nnoremap <silent><F5> :call StatusToggle()<CR>
nnoremap <silent><F7> :ClangFormat<CR>
nnoremap <silent><F8> :TagbarToggle<CR>
nnoremap <silent><F10> :Gstatus<CR>
set pastetoggle=<F12>

" -- Statusline
set statusline=\ %f\ %m%r%h%w%y\ %{GitStatusline()}%=%l\/%-6L\ %3c\ 
set laststatus=2

" -- Plugins
filetype off

call plug#begin()

Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': ['latex', 'tex']}
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'Matt-Deacalion/vim-systemd-syntax', {'for': 'systemd'}
Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
Plug 'mattn/emmet-vim', {'for': ['hmtl', 'jinja']}
Plug 'mitsuhiko/vim-jinja', {'for': 'jinja'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'petRUShka/vim-opencl', {'for': 'opencl'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'justinmk/vim-dirvish'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'rhysd/vim-clang-format'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'

Plug 'romainl/Apprentice'
Plug 'w0rp/ale'

" Plug 'Chilledheart/vim-clangd'

call plug#end()

filetype plugin indent on
if !exists(g:syntax_on)
	syntax enable
endif

"-- matchit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" -- gui/console look
if has('gui_running')
	set guifont=Source\ Code\ Pro\ Medium\ 10
	colorscheme apprentice

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
	colorscheme apprentice
endif

" -- Plugins Options

" -- delimitMate
let delimitMate_expand_cr=1

" -- BufOnly
nnoremap <Leader>o :BufOnly<CR>

" -- Latex-Box
let g:LatexBox_quickfix = 3
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
let g:ctrlp_working_path_mode = 0

" -- buftabline
let g:buftabline_show = 1

" -- vim-tmux-navigator & neovim compat
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" -- editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" -- ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
			\'cpp': ['clangtidy', 'clangcheck'],
			\'latex': ['chktex', 'proselint']
			\}
let g:ale_cpp_clangcheck_options = '-Wall -Wextra -Werror -I../includes -I./includes -I. -std=c++14'
let g:ale_cpp_clangtidy_options = '-Wall -Wextra -Werror -I../includes -I./includes -I. -std=c++14'

" -- commentary
autocmd FileType cfg setlocal commentstring=#\ %s
autocmd FileType cmake setlocal commentstring=#\ %s

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
