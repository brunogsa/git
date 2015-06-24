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
" My Snippets
" ===============================================
if &filetype == "javascript"
    imap <leader>if if () {<cr><cr>} 
    imap <leader>el else {<cr><cr>} 
    imap <leader>ei else if () {<cr><cr>} 
    imap <leader>fo for () {<cr><cr>} 
    imap <leader>wh while () {<cr><cr>} 
    imap <leader>fu function () {<cr><cr>} 
    imap <leader>mo ( function() {<cr><cr>}() ))
    imap <leader>/* /**<cr><cr><cr>/
    imap <leader>to // TODO: 
    imap <leader>fi // FIXME: 
endif

" ===============================================
