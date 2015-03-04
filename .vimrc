" ===============================================
" Ease plugin management
" ===============================================
set nocompatible
call pathogen#infect()
filetype plugin indent on
filetype on

" ===============================================
" Encode issues
" ===============================================
let $LANG='en'
set langmenu=en
set encoding=utf8
set ffs=unix,dos,mac

" ===============================================
" Efficient vim
" ===============================================
set lazyredraw
set autoread
set ruler
set title
set backspace=indent,eol,start
set cursorline
set clipboard=unnamed
set showmatch
set nobackup
set nowb
set noswapfile
set viminfo^=%

" Use mouse when it exists
if has('mouse')
    set mouse=a
endif

" ===============================================
" Identation config
" ===============================================
syntax on
set autoindent
set smartindent
set wrap
set cindent
set preserveindent
set copyindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set smarttab
set expandtab

" ===============================================
" Style
" ===============================================
set background=dark
colorscheme gruvbox
set foldcolumn=1
set lbr
set tw=250
set scrolloff=5

" Delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

" ===============================================
" Search system
" ===============================================
set incsearch
set ignorecase
set smartcase

" ===============================================
" Split window preferences
" ===============================================
set splitbelow
set splitright

" ===============================================
" Tab complete options
" ===============================================
set wildmode=longest,list
set wildmenu
set completeopt=longest,menu
set complete-=i
let g:SuperTabDefaultCompletionType = "context"

" ===============================================
" Remaps
" ===============================================
map <silent> <Left> h
map <silent> <Down> gj
map <silent> <Up> gk
map <silent> <Right> l
map e $
map b 0
map z %

" ===============================================
" Hotkeys
" ===============================================
nmap <silent> <leader>c <leader>c<space>
vmap <silent> <leader>c <leader>cs
nmap <silent> <leader>n :set invnumber<cr>
map <silent> <leader>s :setlocal spell!<cr>

" Automatically turns off identation when pasting something with CTRL+SHIFT+V
map <silent> <C-S-v> :setlocal paste!<cr>p:setlocal paste!<cr>

" ===============================================
