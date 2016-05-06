" ===============================================
" Ease plugin management
" ===============================================
set nocompatible
set encoding=utf-8
scriptencoding utf-8

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
filetype on

" ===============================================
" Efficient vim
" ===============================================
set autoread
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
set wrap
set mouse=n

" Indetation for HTML
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

" Tab vs Spaces...
" set expandtab

" ===============================================
" Style
" ===============================================
set background=dark
colorscheme monokai
set lbr
set tw=250
set scrolloff=5
hi MatchParen cterm=bold ctermbg=lightblue ctermfg=black

" Status Line
set noruler
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'component': {
      \   'readonly': '%{&readonly?"READ-ONLY":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" Uses vim colorscheme and gnome-terminal transparency
set t_Co=256
hi Normal ctermbg=none
highlight NonText ctermbg=none

" Highlight cursor column
set cursorcolumn

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

" ===============================================
" Hotkeys
" ===============================================
map <Leader><Leader> <Leader>c<Space>
map <F2> :set number!<Cr>
map <2-LeftMouse> \m
map <F5> :source ~/.vimrc<Cr>
map <F6> :NERDTreeToggle<Cr>
map <Leader><Up> :resize +5<Cr>
map <Leader><Down> :resize -5<Cr>
map <Leader><Left> :vertical resize +5<Cr>
map <Leader><Right> :vertical resize -5<Cr>
vnoremap <Leader>/ <Esc>/\%V

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" You can format XML (1 by 1) via visual mode clicking on "\x"
map <silent> <leader>x :!xmllint --format --recover - 2>/dev/null<cr>

" You can ident XML with this
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" ===============================================
" Syntastic
" ===============================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_wq = 1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_mode_map = { "mode": "passive" }
let syntastic_aggregate_errors = 1

let g:syntastic_javascript_checkers = ['jshint', 'jscs']

" ===============================================
" Delimit Mate Options
" ===============================================
let delimitMate_matchpairs = "(:),[:],{:}"

" ===============================================
" Run Time Features
" ===============================================
autocmd FilterWritePre * if &diff | setlocal wrap< | endif	" Automatically set wrap when starting a vim diff

" ===============================================
