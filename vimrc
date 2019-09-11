" plugins =======================================================================
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/bin/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mptre/vim-printf'
Plug 'neovim/python-client', { 'do': 'pip3 install neovim --user' }
Plug 'petRUShka/vim-opencl'
Plug 'Raimondi/delimitMate'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'simnalamburt/vim-mundo'
Plug 'tikhomirov/vim-glsl'
Plug 'tommcdo/vim-lion'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'travitch/hasksyn', { 'for': 'haskell' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }

call plug#end()

filetype plugin indent on

" lets =========================================================================
let g:python3_host_prog = '/usr/bin/python3.7'

let g:mapleader = ","

let g:airline#extensions#tabline#close_symbol = 'x'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#ale#enabled = 1
let g:airline_left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_theme = 'solarized'
let g:airline_section_z = '%3p%% %4l/%L:%3v'

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" Proper HTML autoindentation
let g:html_indent_inctags = "head,html,body,p,table,tbody,div,script,section"
let g:html_indent_inctags += ",h1,h2,h3,li"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:ale_sign_error = 'x>'
let g:ale_sign_warning = '!>'
let g:ale_linters = {
      \ 'c': [ 'clang', 'gcc' ],
      \ 'cpp': [ 'clang', 'clangcheck', 'clang-format', 'cppcheck', 'cpplint', 'g++' ]
      \ }
let g:ale_cpp_clangcheck_options = '-std=c++14'
let g:ale_c_clang_options = ''
let g:ale_c_gcc_options = ''
let g:ale_nasm_nasm_options = '-f elf64'
let g:ale_completition_enabled = 1

let g:acp_enableAtStartup = 0

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

let g:lion_squeeze_spaces = 1

let g:fzf_layout = { 'up': '~33%' }

" let g:gutentags_tagfile = '.git/tags'

" Variable passed to shell for it to know it was opened with :shell
let $FROMVIM=1

" maps =========================================================================
" Map tab to escape and Shift-Tab to literal Tab
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <S-Tab> <Tab>

nnoremap <C-p> :Files<CR>

" Swap j/k and gj/gk
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

nnoremap <Space> za

" :%s/<selected text>/
vmap <Leader>s "sy:%s/<C-R>"/

" Search for selected text in directory and open quickfix list
vmap <Leader>v "sy:grep! <C-R>"<CR>:cw<CR>

function! BigSearch()
	let search = input("rg ")
	execute ":grep! " . search
	cw
endfunction
nmap <Leader>b :call BigSearch()<CR>

nmap <Leader>m :!make<CR>

nmap <Leader>u :MundoToggle<CR>

" Open C++ header in vsplit in every tab
nmap <Leader>h :tabdo if filereadable(expand("%:r") . ".hpp") \| vs `=expand("%:r") . ".hpp"` \| endif<CR>:tabdo if filereadable(expand("%:r") . ".hh") \| vs `=expand("%:r") . ".hh"` \| endif<CR>:tabdo if filereadable(expand("%:r") . ".h") \| vs `=expand("%:r") . ".h"` \| endif<CR>:silent tabfirst<CR>

nmap <Leader>w :w<CR>

" Last used tab
let g:lasttab = 1
nmap <Leader>l :exe "tabn " . g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

nmap <Leader>t :TagbarToggle<CR>

nmap <Leader>p :Printf<CR>

nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>gs :GitGutterStageHunk<CR>

nnoremap Q @q

nnoremap <S-l> gt
nnoremap <S-h> gT

nnoremap go moo<Esc>`o
nnoremap gO moO<Esc>`o

nmap <C-q> :q<CR>

nnoremap zT :%foldc<CR>

nnoremap gf <C-w>gF

vnoremap <C-b> :<ESC>
              \:let _name=@%<CR>
              \:let _begin=line("'<")<CR>
              \:let _end=line("'>")<CR>
              \:tabedit<CR>
              \:tabm -1<CR>
              \:execute("r !git blame "._name." -L"._begin.","._end)<CR>
              \:setlocal buftype=nofile<CR>
              \:setlocal bufhidden=hide<CR>
              \ggdd<CR>

vnoremap <C-g> :<ESC>
              \:tabedit<CR>
              \:tabm -1<CR>
              \:execute("r !git show " . getreg('*'))<CR>
              \:setlocal buftype=nofile<CR>
              \:setlocal bufhidden=hide<CR>
              \:setlocal filetype=diff<CR>
              \ggdd<CR>

" disable :X. purposedfully remap not to <nop>
cnoreabbrev X asdf

nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

vnoremap gi g<C-a>

" sets =========================================================================
set autoindent
set autoread
set autowrite                   " Auto write on :make, :shell and others
set backspace=2                 " Allow backspacing everywhere
set cindent                     " C-style autoindenting
set cinoptions=g0               " Align public:, private: etc in C++ to column 1
set cinoptions+=ls              " switch case labels indentation
set cinoptions+=:0              " also switch case labels indentation
set cinoptions+=N-s             " don't indent in namespaces
set colorcolumn=100
set completeopt-=preview        " Don't show autocompletition window on top
set cursorline                  " Highlight line with cursor
set encoding=utf-8              " Default encoding
set expandtab                   " use spaces instead of tabs everywhere
set fileformats="unix,dos,mac"  " Line ending priority
set fillchars=vert:│,fold:─,diff:─ " Pretty window separators
set foldlevelstart=9            " close folds after level 9 at start
set foldmethod=syntax
set foldnestmax=12              " max 12 folds
set formatoptions+=tqc          " default options for auto wrapping at textwidth
set formatoptions-=ro           " don't insert comments on new lines
set formatoptions+=nj           " dunno lol
set gdefault                    " g flag by default in substitutions
set grepprg=rg\ --vimgrep\ -g\ \!tags
set grepformat=%f:%l:%c:%m
set history=1000                " :command history
set hidden
set ignorecase                  " Ignore case when searching
set incsearch                   " Incremental search: search-as-type
set laststatus=2                " Always show status bar
set lazyredraw                  " Don't redraw while executing macros
set list listchars=tab:\|─,trail:·,nbsp:↔ " Display nonprintable characters
set matchtime=3                 " Time to show matching bracket
set mouse=a                     " enable mouse
set nobackup                    " Don't backup before overwrite
set noshowmode                  " No need to show mode thanks to airline
set nostartofline               " Leave cursor position on <C-d>, G, dd, >> etc
set noswapfile                  " No *.swp files
set number                      " Show line numbers
set numberwidth=3               " Number column width
set omnifunc=syntaxcomplete#Complete
set scrolloff=3                 " How many lines to keep visible when scrolling
set shiftwidth=4                " An indent is 4 spaces
set showcmd                     " Show command being typed
set showmatch                   " Show matching bracket
set sidescrolloff=5             " How many lines to keep visible when scrolling
set smartcase                  " Ignore case
set splitright                  " Split new (vertical) windows to the right
set synmaxcol=200               " stop syntax highlighting past this column
set tabpagemax=50               " 50 tabs (:tabe, vim -p, ..) max
set tabstop=8                   " A tab character is displayed as 4 spaces max
set textwidth=100               " Auto break text exceeding 100 chars
set undodir=~/.vim/undo
set undofile
set visualbell                  " Don't flash screen
set whichwrap+=<,>,h,l          " Wrap h, l, and cursor keys to other lines
set wildignore=*.bak,*.pyc,*.class,*.o,.git
set wildignorecase
set wildmenu
set wildmode=longest:full,full

" autocmds =====================================================================
augroup language_specific_overrides
	au!
	au Filetype ruby    setlocal et sw=2
	au Filetype haskell setlocal et sw=4
	au Filetype erlang  setlocal et sw=4
	au FileType erlang  let b:printf_pattern = 'io:format("%p~n", [%s]),'
	au FileType c       set commentstring=\/*\ %s\ *\/
	au FileType cpp     set commentstring=\/\/\ %s
	au Filetype scheme  setlocal expandtab sw=4 lispwords-=define
	au FileType help    wincmd K
	au FileType nasm    set commentstring=;\ %s
	au FileType *       setlocal formatoptions-=o
	au FileType qf      nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
augroup END

augroup line_numbers
	au!
	au InsertEnter * setlocal nornu
	au InsertLeave * setlocal rnu
	au BufNewFile  * setlocal rnu
	au BufReadPost * setlocal rnu
	au FocusLost   * setlocal nornu
	au FocusGained * setlocal rnu
	au WinEnter    * setlocal rnu
	au WinLeave    * setlocal nornu
augroup END

augroup auto_resize_splits
	au TabEnter   * wincmd =
	au VimResized * wincmd =
augroup END

au BufWritePost * GitGutter

au BufRead,BufNewFile *.s   set filetype=nasm
au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.h   set filetype=c

" cosmetic =====================================================================
if (&t_Co > 8 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif
set background=dark
colorscheme solarized
call matchadd('ColorColumn', '\%101v', 100)

" commands =====================================================================
command! W w !sudo tee % > /dev/null

command! Dos2Unix %s///

command! StripTrailingWhitespace %s/\s\+$//

command! ChmodX !chmod 755 %

