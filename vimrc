" Plugins =======================================================================
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'emgram769/vim-multiuser'
Plug 'Konfekt/FastFold'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mptre/vim-printf'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'sjl/gundo.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'travitch/hasksyn', { 'for': 'haskell' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }

call plug#end()

filetype plugin indent on

" lets =========================================================================
let g:mapleader = ","

let g:airline#extensions#tabline#close_symbol = '✘'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_theme = 'solarized'
 "
" Proper HTML autoindentation
let g:html_indent_inctags = "head,html,body,p,table,tbody,div,script,section"
let g:html_indent_inctags += ",h1,h2,h3,li"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_error_symbol = '✘☛'
let g:syntastic_stl_format = '%E{✗ %fe Σ:%e}%B{ | }%W{⚠ %fw Σ:%w}'
let g:syntastic_style_error_symbol = '✗~'
let g:syntastic_style_warning_symbol = '⚠~'
let g:syntastic_warning_symbol = '⚠☛'

" Use ag in CtrlP for listing files
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

" let g:gutentags_tagfile = '.git/tags'

" Variable passed to shell for it to know it was opened with :shell
let $FROMVIM=1

" Key remaps ===================================================================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <C-n> :Vexplore<CR>

inoremap <expr><C-l> neocomplete#complete_common_string()

" Swap j/k and gj/gk
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap <Space> za

" :%s/<selected text>/
vmap <Leader>s "sy:%s/<C-R>"/
" Search for selected text in directory and open quickfix list
vmap <Leader>v "sy:grep! <C-R>" **/*<CR>:cw<CR>
function! BigSearch()
	let search = input("What to search: ")
	execute ":grep! " . search . " **/*"
	cw
endfunction
nmap <Leader>b :call BigSearch()<CR>
nmap <Leader>m :!make<CR>
nmap <Leader>x :w<CR>:!chmod 755 %<CR>:e<CR>
nmap <Leader>u :GundoToggle<CR>
" Last used tab
let g:lasttab = 1
nmap <Leader>l :exe "tabn " . g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Open C++ header in vsplit in every tab
nmap <Leader>h :tabdo if filereadable(expand("%:r") . ".hpp") \| vs `=expand("%:r") . ".hpp"` \| endif<CR>:tabdo if filereadable(expand("%:r") . ".hh") \| vs `=expand("%:r") . ".hh"` \| endif<CR>:tabdo if filereadable(expand("%:r") . ".h") \| vs `=expand("%:r") . ".h"` \| endif<CR>:silent tabfirst<CR>
nmap <Leader>H :tabdo if filereadable(expand("%:r") . ".hpp") \| sp `=expand("%:r") . ".hpp"` \| endif<CR>:tabdo if filereadable(expand("%:r") . ".hh") \| sp `=expand("%:r") . ".hh"` \| endif<CR>:tabdo if filereadable(expand("%:r") . ".h") \| sp `=expand("%:r") . ".h"` \| endif<CR>:silent tabfirst<CR>
nmap <Leader>w :w<CR>

nmap <Leader>o :CtrlPBuffer<CR>
nmap <Leader>t :CtrlPTag<CR>

nmap <Leader>p :Printf<CR>

" Map tab to escape and Shift-Tab to literal Tab
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <S-Tab> <Tab>

nnoremap Q @q
nnoremap <S-l> gt
nnoremap <S-h> gT

nnoremap go mpo<Esc>`p
nnoremap gO mpO<Esc>`p

" Sets =========================================================================
set autoindent
set autowrite                   " Auto write on :make, :shell and others
set backspace=2                 " Allow backspacing everywhere
set cindent                     " C-style autoindenting
set cinoptions=g0               " Align public:, private: etc in C++ to column 1
set cinoptions+=ls              " switch case labels indentation
set cinoptions+=N-s             " don't indent in namespaces
set completeopt-=preview        " Don't show autocompletition window on top
set cursorline                  " Highlight line with cursor
set encoding=utf-8              " Default encoding
set fileformats="unix,dos,mac"  " Line ending priority
set fillchars=vert:│,fold:─,diff:─ " Pretty window separators
set foldlevelstart=9            " close folds after level 9 at start
set foldmethod=syntax
set foldnestmax=12              " max 12 folds
set formatoptions+=tqc          " default options for auto wrapping at textwidth
set formatoptions-=ro           " don't insert comments on new lines
set formatoptions+=nj           " dunno lol
set history=1000                " :command history
set ignorecase                  " Ignore case when searching
set incsearch                   " Incremental search: search-as-type
set laststatus=2                " Always show status bar
set lazyredraw                  " Don't redraw while executing macros
set list listchars=tab:\|─,trail:·,nbsp:↔ " Display nonprintable characters
set matchtime=3                 " Time to show matching bracket
set mouse=a                     " Enable mouse
set nobackup                    " Don't backup before overwrite
set noshowmode                  " No need to show mode thanks to airline
set nostartofline               " Leave cursor position on <C-d>, G, dd, >> etc
set noswapfile                  " No *.swp files
set number                      " Show line numbers
set omnifunc=syntaxcomplete#Complete
set scrolloff=3                 " How many lines to keep visible when scrolling
set shiftwidth=4                " An indent is 4 spaces
set showcmd                     " Show command being typed
set showmatch                   " Show matching bracket
set splitright                  " Split new (vertical) windows to the right
set tabpagemax=50               " 50 tabs (:tabe, vim -p, ..) max
set tabstop=4                   " A tab character is displayed as 4 spaces max
set textwidth=80                " Auto break text exceeding 80 chars
set undodir=~/.vim/undo
set undofile
set visualbell                  " Don't flash screen
set whichwrap+=<,>,h,l          " Wrap h, l, and cursor keys to other lines
set wildignore=*.bak,*.pyc,*.class,*.o,.git
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set smartcase                  " Ignore case

" Autocmds =====================================================================
augroup lso
	au!
	au Filetype ruby setlocal et sw=2
	au Filetype haskell setlocal et sw=4
	au Filetype erlang setlocal et sw=4
	au FileType cpp set commentstring=\/\/\ %s
	au FileType cpp setlocal et ts=2 sw=2
	au Filetype scheme setlocal expandtab sw=4 lispwords-=define
	au FileType help wincmd K
augroup END

autocmd FileType * setlocal formatoptions-=o

augroup linenumbers
	au!
	au InsertEnter * setlocal nornu
	au InsertLeave * setlocal rnu
	au BufNewFile *  setlocal rnu
	au BufReadPost * setlocal rnu
	au FocusLost *   setlocal nornu
	au FocusGained * setlocal rnu
	au WinEnter *    setlocal rnu
	au WinLeave *    setlocal nornu
augroup END

autocmd FileType erlang let b:printf_pattern = 'io:format("%p", [%s]),'

" Cosmetic =====================================================================
if (&t_Co > 8 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif
set background=dark
colorscheme solarized
call matchadd('ColorColumn', '\%81v', 100)

" Commands =====================================================================
command! W w !sudo tee % > /dev/null
" Disable :X
set key=

