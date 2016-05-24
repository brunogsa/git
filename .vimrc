" ===============================================
" Ease plugin management
" ===============================================
set nocompatible
set encoding=utf-8
scriptencoding utf-8

call pathogen#infect()
call pathogen#helptags()
filetype indent on
filetype plugin on
filetype on

" ===============================================
" Efficient vim
" ===============================================
set title
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set cursorline
set showmatch
set nobackup
set nowritebackup
set noswapfile
set viminfo^=%
let g:LargeFile=0.5

" Auto reloading
set autoread
set updatetime=1000
au CursorMoved,CursorMovedI,CursorHold,CursorHoldI * checktime

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
set foldmethod=indent
set foldlevelstart=1
set list lcs=tab:\┆\ 

"let javaScript_fold=1         " JavaScript
"let perl_fold=1               " Perl
"let php_folding=1             " PHP
"let r_syntax_folding=1        " R
"let ruby_fold=1               " Ruby
"let sh_fold_enabled=1         " sh
"let vimsyn_folding='af'       " Vim script
"let xml_syntax_folding=1      " XML

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

let g:SuperTabDefaultCompletionType = "context"

" Make CTRL+Space to Omnicomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" ===============================================
" Hotkeys
" ===============================================
map <silent> <Left> h
map <silent> <Down> gj
map <silent> <Up> gk
map <silent> <Right> l
map e $
map b 0
map <F2> :set number!<Cr>
map <F5> :source ~/.vimrc<Cr>
map <Leader><Up> :resize +5<Cr>
map <Leader><Down> :resize -5<Cr>
map <Leader><Left> :vertical resize +5<Cr>
map <Leader><Right> :vertical resize -5<Cr>
vnoremap <Leader>/ <Esc>/\%V

" ===============================================
" Easy Mark
" ===============================================
map <2-LeftMouse> \m

" ===============================================
" Easy Align
" ===============================================

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" ===============================================
" Pretty XML
" ===============================================
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

" You can format XML (1 by 1) via visual mode clicking on "\x"
map <silent> <leader>x :!xmllint --format --recover - 2>/dev/null<cr>

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
" Tag Bar
" ===============================================
nmap <F8> :TagbarToggle<CR>

" ===============================================
" Easy Motion
" ===============================================
nmap s <Plug>(easymotion-s)

" ===============================================
" Nerd Commenter
" ===============================================
map <Leader><Leader> <Leader>c<Space>

" ===============================================
" Rainbow Parentheses
" ===============================================
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['black',       'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" ===============================================
