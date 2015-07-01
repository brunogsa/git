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
set clipboard=unnamedplus
set cursorline
set showmatch
set nobackup
set nowritebackup
set noswapfile
set viminfo^=%
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

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" ===============================================
" Folding
" ===============================================
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

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
map <F2> :set number!<cr>
map <2-LeftMouse> \m
map <F5> :source ~/.vimrc<cr>
map <S-Tab> :NERDTreeToggle<CR>

" ===============================================
" Snippets
" ===============================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><tab>"

" ===============================================
" Run Time Features
" ===============================================
set runtimepath+=~/.vim/bundle/jshint2.vim
let jshint2_read = 1
let jshint2_save = 1
let jshint2_min_height = 6
let jshint2_max_height = 12
let jshint2_confirm = 1

" ===============================================
