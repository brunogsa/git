" ===============================================
" Ease plugin management
" ===============================================
set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
filetype on

" ===============================================
" Encode issues
" ===============================================
let $LANG='en'
set langmenu=en

" ===============================================
" Efficient vim
" ===============================================
set lazyredraw
set autoread
set ruler
set title
set backspace=indent,eol,start
set cursorline
set clipboard=unnamedplus
set showmatch
set nobackup
set nowritebackup
set noswapfile
set viminfo^=%
set mouse=a
let g:LargeFile=0.5

" ===============================================
" Identation config
" ===============================================
syntax on
set autoindent
set smartindent
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
set lbr
set tw=250
set scrolloff=5
set foldmethod=indent

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
map <silent> <leader>v :set paste<cr>"+p:set nopaste<cr>

" ===============================================
" Hotkeys
" ===============================================
map <silent> <leader><leader> <leader>c<space>
map <F1> :set number!<cr>
map <2-LeftMouse> \m
map <F5> :source ~/.vimrc<cr>
map <S-Tab> :NERDTreeToggle<CR>

" ===============================================
" Snippets
" ===============================================
" Trigger configuration
let g:UltiSnipsExpandTrigger="<leader>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ===============================================
