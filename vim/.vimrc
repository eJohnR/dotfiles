" ---------------------------------------------------------
"  John Rowley
"  John.A.Rowley@Googlemail.com
"  vimrc
"  Modified: Mon Feb 16 19:48:12 GMT 2015
" ---------------------------------------------------------

" Clear autocmds
autocmd!

" Disable compatibly with Vi
set nocompatible

" Load vimrc from current directory and disable unsafe commands in them
set exrc
set secure

" Respect modelines in file up to this number of lines
set modeline
set modelines=4

" ---------------------------------------------------------
" Vundle
" ---------------------------------------------------------

" If Vundle isn't installed, install it
let vundleInstalled=0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle.."
   echo ""
   silent !mkdir -p ~/.vim/bundle
   silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
   let vundleInstalled=1
endif

" Required for Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ---------------------------------------------------------
" Manage Bundles
" ---------------------------------------------------------

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'godlygeek/tabular'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/neocomplete'
Bundle 'tpope/vim-vinegar'
Bundle 'w0ng/vim-hybrid'

if vundleInstalled == 1
   echo "Installed Bundles.."
   echo ""
   :BundleInstall
endif

" ---------------------------------------------------------
" Leader Key
" ---------------------------------------------------------

let mapleader = ","

" Count Words/Characters
map <leader>c g<C-G>
" Edit Vimrc Quickly
map <leader>vi ;e $MYVIMRC<CR>
" Delete Trailing Whitespace
map <leader>rw ;%s/\s\+$//<CR>;w<CR>
" Retab and Reformat the File with Spaces
map <leader>R ;set expandtab<CR>;retab!<CR>

" Add Blank Lines w/o Leaving Normal Mode
map <leader>o o<ESC>
map <leader>O O<ESC>

" Open Any File Anywhere
map <leader>e ;e **/*

" Edit another file in the same dir as the current file
" uses expression to extract path from current file's path
" Thanks Ben Orenstein(@r00k)
map <leader>s ;split <C-R>=expand("%:p:h") . '/'<CR>
map <leader>v ;vsplit <C-R>=expand("%:p:h") . '/'<CR>

" Common Alignment Shortcuts
if exists(":Tabularize")
	nmap <leader>a= ;Tabularize /=<CR>
	vmap <leader>a= ;Tabularize /=<CR>
	nmap <leader>a; ;Tabularize /:<CR>
	vmap <leader>a; ;Tabularize /:<CR>
endif

" Insert Date at Cursor
map <leader>d ;r !date<CR> I<BS><ESC>

" Reload my .vimrc
map <leader>S ;source $MYVIMRC<CR>

" ---------------------------------------------------------
" Editing
" ---------------------------------------------------------

" Set File Encoding/Format
set encoding=utf-8
set fileformats=unix,dos,mac
set formatoptions=tcrql
set formatprg=par

" Enable Syntax Highlighting
syntax on
filetype plugin indent on

" Colour Scheme & Font
set background=dark
set guifont=Source\ Code\ Pro:h12
colorscheme hybrid

" Splitting Buffers
set splitbelow
set splitright

" Fix Backspace/Clipboard
set backspace=start,indent,eol
if $TMUX == ''
  set clipboard=unnamed
endif

" Invisibles
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Location Indicators
set nocursorcolumn
set cursorline

" Line Number/Wrapping
set textwidth=72
set colorcolumn=80
set numberwidth=5
set relativenumber
set number
set ruler

" Enable wrapping
set showbreak=↪\
set wrap

" Brackets
set showmatch
set matchtime=2

" Tabs
set shiftround
set shiftwidth=4
set tabstop=4

set noexpandtab
set smartindent
set autoindent
set copyindent
set smarttab

set ai
set si

" Search
set ignorecase
set incsearch
set smartcase
set hlsearch

" ---------------------------------------------------------
" Key Mappings
" ---------------------------------------------------------

" Disable Arrow Keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Navigate Tabs Easily
map <C-l> ;tabn<CR>
map <C-h> ;tabp<CR>
map <C-n> ;tabnew<CR>

" Swap ; with :
noremap ; :
noremap : ;

" Easy Movement
nmap k gk
nmap j gj

" ---------------------------------------------------------
" UI
" ---------------------------------------------------------

" Hide Toolbar While Running
if has("gui_running")
    set guioptions=egmt
endif

" Scroll Window
set scrolloff=10

" Blink
set visualbell

" No redraw while executing macros
set lazyredraw

" Fast redraw
set ttyfast

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256

" Don't syntax highlight long lines
set synmaxcol=256

" Show incomplete commands
set showcmd

" ---------------------------------------------------------
" Status Line
" ---------------------------------------------------------

" 256 Colours
set t_Co=256

" Show Status Line
set laststatus=2

set statusline=
set statusline+=%1*\ %=%{&modified?'*':''} " Modified Flag
set statusline+=%2*\ %{&ff}\ \|            " File Format
set statusline+=%2*\ %{&fenc}\ \|          " File Encoding
set statusline+=%2*\ %{&ft}\ \             " Filetype

" Status Line & Column Colour Settings
hi User1       ctermfg=1  guifg=#A54242
hi User2       ctermfg=8  guifg=#373B41
hi ColorColumn ctermbg=1  guibg=#A54242

" ---------------------------------------------------------
" Plugins
" ---------------------------------------------------------

" delimitMate
let g:delimitMate_expand_cr=1

" NeoComplete

" Enable at Startup
let g:neocomplete#enable_at_startup=1

" Use Smartcase
let g:neocomplete#enable_smart_case=1

" <TAB> Completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ---------------------------------------------------------
" Language Specific
" ---------------------------------------------------------

" .py
au BufNewFile,BufRead *.py setlocal ai si et ts=2 sw=2 sts=2

" .tex
au BufNewFile,BufRead *.tex set spell

" ---------------------------------------------------------
" File Management
" ---------------------------------------------------------

" Save on Losing Focus
au FocusLost * :wa

" Undo File Changes
if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000
endif
set undolevels=1000

" Wildmode

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable images
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig,*.psd,*.gif

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

set wildmode=list:longest,full
set wildmenu

" Buffer Management
set autoread
set autowrite
set hidden

" Disable Backup
set noswapfile
set nobackup
set nowb
