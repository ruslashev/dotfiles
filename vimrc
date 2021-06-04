" plugins =======================================================================
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf', { 'dir': '~/bin/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'ludovicchabant/vim-gutentags', { 'commit': 'aa67e48f6c071ef4179dc30ac24ddf93e5eb6338' }
Plug 'Raimondi/delimitMate'
Plug 'romainl/vim-cool'

" New actions and movements
Plug 'justinmk/vim-printf'
Plug 'simnalamburt/vim-mundo'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Appearance
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes', { 'commit': 'b85165844240fe0b9121df487679a320e053abc7' }

" Syntax and language-specific
Plug 'petRUShka/vim-opencl'
Plug 'tikhomirov/vim-glsl'
Plug 'travitch/hasksyn', { 'for': 'haskell' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }

" Autocomplete
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/deoplete.nvim', { 'do': 'pip3 install neovim --user' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

call plug#end()

filetype plugin indent on

" lets =========================================================================
let g:python3_host_prog = '/usr/bin/python3'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
let g:acp_enableAtStartup = 0

let g:mapleader = ","

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#scrollbar#enabled = 0
let g:airline_left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_theme = 'solarized'
let g:airline_section_z = '%3p%% %l/%L:%v'
let g:airline_section_y = '%{LastSearchCount()}'
let g:airline_section_b = ''

let g:airline#extensions#searchcount#enabled = 0
function! LastSearchCount() abort
  try
    let result = searchcount(#{recompute: 1, maxcount: -1})
    if empty(result) || result.total ==# 0
      return ''
    endif
    if result.incomplete ==# 1     " timed out
      return printf('%s [?/??]', @/)
    elseif result.incomplete ==# 2 " max count exceeded
      if result.total > result.maxcount && result.current > result.maxcount
        return printf('%s [>%d/>%d]', @/, result.current, result.total)
      elseif result.total > result.maxcount
        return printf('%s [%d/>%d]', @/, result.current, result.total)
      endif
    endif
    return printf('%s [%d/%d]', @/, result.current, result.total)
  catch
    return ''
  endtry
endfunction

" Proper HTML autoindentation
let g:html_indent_inctags = "head,html,body,p,table,tbody,div,script,section"
let g:html_indent_inctags += ",h1,h2,h3,li"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:ale_sign_error = 'x>'
let g:ale_sign_warning = '!>'
let g:ale_linters = {
      \ 'c': [ 'ccls', 'clang', 'clangd', 'clang-format', 'clangtidy', 'cppcheck', 'cpplint',
      \        'cquery', 'gcc', 'uncrustify' ],
      \ 'cpp': [ 'ccls', 'clang', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cpplint',
      \          'cquery', 'flawfinder', 'gcc' ],
      \ 'rust': [ 'cargo', 'analyzer' ],
      \ }
let g:ale_lint_delay = 0
let g:ale_c_clang_options = ''
let g:ale_c_gcc_options = ''
let g:ale_cpp_clangcheck_options = '-std=c++14'
let g:ale_nasm_nasm_options = '-f elf64'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

let g:lion_squeeze_spaces = 1

let g:fzf_layout = { 'up': '~33%' }
let debian = system('uname -a | grep -q Debian')
if v:shell_error == 0
    let $FZF_DEFAULT_COMMAND='fdfind --type f'
else
    let $FZF_DEFAULT_COMMAND='fd --type f'
endif

let g:mkdp_page_title = '${name}'

let g:gutentags_ctags_tagfile = '.git/tags'

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
nnoremap <C-w>r :GFiles<CR>
nnoremap <C-w>w :Windows<CR>

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

" prompt for text to search and show result in quickfix list
function! BigSearch()
	let search = input("rg ")
	execute ":grep! '" . search . "'"
	cw
endfunction
nmap <Leader>b :call BigSearch()<CR>

nmap <Leader>m :!make<CR>

nmap <Leader>u :MundoToggle<CR>

" Open C++ header in vsplit in every tab
nmap <Leader>h
            \:tabdo if filereadable(expand("%:r") . ".hpp") \| vs `=expand("%:r") . ".hpp"` \| endif<CR>
            \:tabdo if filereadable(expand("%:r") . ".hh") \| vs `=expand("%:r") . ".hh"` \| endif<CR>
            \:tabdo if filereadable(expand("%:r") . ".h") \| vs `=expand("%:r") . ".h"` \| endif<CR>
            \:silent tabfirst<CR>

nmap <Leader>w :w<CR>

" Last used tab
let g:lasttab = 1
nmap <Leader>l :exe "tabn " . g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

nmap <Leader>p :Printf<CR>

nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>gs :GitGutterStageHunk<CR>
nnoremap <Leader>ge :GitGutterEnable<CR>
nnoremap <Leader>gd :GitGutterDisable<CR>

nnoremap <Leader>ae :ALEEnable<CR>
nnoremap <Leader>ad :ALEDisable<CR>
nnoremap <Leader>a] :ALEGoToDefinition<CR>
nnoremap <Leader>ar :ALEFindReferences<CR>
nnoremap <Leader>ak :ALEHover<CR>
nnoremap <Leader>as :ALESymbolSearch<CR>
nnoremap <Leader>aR :ALERename<CR>

nnoremap <Leader>rg :Rg<CR>

nnoremap Q @q

nnoremap <S-l> gt
nnoremap <S-h> gT

nnoremap go moo<Esc>`o
nnoremap gO moO<Esc>`o

nnoremap <Leader>fc :%foldc<CR>
nnoremap <Leader>fo :%foldo<CR>

nnoremap gf <C-w>gF

vnoremap <C-b> :<ESC>
              \:let _name=@%<CR>
              \:let _begin=line("'<")<CR>
              \:let _end=line("'>")<CR>
              \:tabedit<CR>
              \:tabm -1<CR>
              \:execute("r !git blame --date=format:'\\%Y-\\%m-\\%d' "._name." -L"._begin.","._end)<CR>
              \:setlocal buftype=nofile<CR>
              \:setlocal bufhidden=hide<CR>
              \ggdd<CR>

vnoremap <C-g> "*y
              \:tabedit<CR>
              \:tabm -1<CR>
              \:execute("r !git show " . getreg('*'))<CR>
              \:setlocal buftype=nofile<CR>
              \:setlocal bufhidden=hide<CR>
              \:setlocal filetype=git<CR>
              \ggdd<CR>

" disable :X. purposedfully remap not to <nop>
cnoreabbrev X asdf

nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

vnoremap gi g<C-a>

nnoremap [a :ALEPrevious<CR>
nnoremap ]a :ALENext<CR>

" sets =========================================================================
set autoindent
set autoread
set autowrite                   " Auto write on :make, :shell and others
set backspace=2                 " Allow backspacing everywhere
set breakindent                 " for wrapping, continue at indent instead of start of line
set cindent                     " C-style autoindenting
set cinoptions=g0               " Align public:, private: etc in C++ to column 1
set cinoptions+=ls              " switch case labels indentation
set cinoptions+=:0              " also switch case labels indentation
set cinoptions+=N-s             " don't indent in namespaces
set colorcolumn=100
set completeopt-=preview        " Don't show autocompletition window on top
set encoding=utf-8              " Default encoding
set expandtab                   " use spaces instead of tabs everywhere
set fileformats="unix,dos,mac"  " Line ending priority
set fillchars=vert:│,fold:\ ,diff:─ " Pretty window separators
set foldlevelstart=9            " close folds after level 9 at start
set foldmethod=syntax
set foldnestmax=12              " max 12 folds
set formatoptions+=qc           " default options for auto wrapping at textwidth
set formatoptions-=ro           " don't insert comments on new lines
set formatoptions+=nj           " dunno lol
set gdefault                    " g flag by default in substitutions
set grepprg=rg\ --vimgrep\ -g\ \!tags
set grepformat=%f:%l:%c:%m
set history=1000                " :command history
set hidden
set hls
set ignorecase                  " Ignore case when searching
set incsearch                   " Incremental search: search-as-type
set laststatus=2                " Always show status bar
set lazyredraw                  " Don't redraw while executing macros
set linebreak                   " Wrap lines at convenient points instead of last screen character
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
set signcolumn=number           " show signs (git, linters) in place of numbers
set smartcase                   " Ignore case
set splitright                  " Split new (vertical) windows to the right
set synmaxcol=200               " stop syntax highlighting past this column
set tabpagemax=50               " 50 tabs (:tabe, vim -p, ..) max
set tabstop=8                   " A tab character is displayed as 4 spaces max
set termguicolors               " enable use of 24-bit colors in terminals
set undodir=~/.vim/undo
set undofile
set updatetime=100              " used by vim-gitgutter
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
	au Filetype opencl  setlocal noet ts=8 sw=8
	au Filetype erlang  setlocal et sw=4
	au FileType erlang  let b:printf_pattern = 'io:format("%p~n", [%s]),'
	au FileType rust    let b:printf_pattern = 'println!("%{}", %s);'
	au FileType python  let b:printf_pattern = 'print("%{}".format(%s))'
	au FileType c       set commentstring=\/*\ %s\ *\/
	au FileType c       set noexpandtab shiftwidth=8
	au FileType cpp     set commentstring=\/\/\ %s
	au FileType cpp     set noexpandtab shiftwidth=8
	au Filetype scheme  setlocal expandtab sw=4 lispwords-=define
	au FileType help    wincmd K
	au FileType nasm    set commentstring=;\ %s
	au FileType *       setlocal formatoptions-=o
	au FileType qf      nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
	au FileType zsh     set filetype=sh
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

set cursorline " highlight line with cursor
augroup CursorLine
	au!
	au WinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

au BufWritePost * GitGutter

au BufRead,BufNewFile *.s           set filetype=nasm
au BufRead,BufNewFile *.asm         set filetype=nasm
au BufRead,BufNewFile *.h           set filetype=c
au BufRead,BufNewFile SConscript    set filetype=python
au BufRead,BufNewFile SConscriptDef set filetype=python

" cosmetic =====================================================================
if (&t_Co > 8 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme solarized8

hi Folded guifg=#586e75 guibg=#002b36 guisp=#002b36
" for listchars
" L*A*B 33 -7 -7
hi SpecialKey guifg=#3C5158 guibg=NONE guisp=NONE gui=NONE cterm=NONE

hi! link SignColumn LineNr

call matchadd('ColorColumn', '\%101v', 100)

" commands =====================================================================
command! W w !sudo tee % > /dev/null

command! Dos2Unix %s///

command! StripTrailingWhitespace %s/\s\+$//

command! ChmodX !chmod 755 %

