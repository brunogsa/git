" ===============================================
" Core Settings
" ===============================================

" Avoid issues with older versions from vim
set nocompatible

" Avoid issues with UTF-8
set encoding=utf-8
scriptencoding utf-8

" Use pathogen as my plugin manager
call pathogen#infect()
call pathogen#helptags()

" Turn on syntax, indent and plugins
filetype indent on
filetype plugin on
filetype on

" Automatically set wrap when starting a vim diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Auto reload vim
set autoread
set updatetime=1000
au CursorMoved,CursorMovedI,CursorHold,CursorHoldI * checktime

" Fold options. I prefer fold by identation
set foldmethod=indent
set foldlevelstart=2
set list lcs=tab:\┆\ 

" Search options
set incsearch
set smartcase

" Split options
set splitbelow
set splitright

" Completion options
set omnifunc=syntaxcomplete#Complete
set wildmode=longest,list
set wildmenu
set completeopt=longest,menu

" Added dictionary words on completion
set complete+=k

" Set vim title automatically
set title

" Make backspace as expected
set backspace=indent,eol,start

" Share clipboard with system
set clipboard=unnamed,unnamedplus

" Add a line above the cursor
set cursorline

" No annoying backup files
set nobackup
set nowritebackup
set noswapfile

set showmatch
set viminfo^=%

" Mouse only works on Normal Mode
set mouse=n

" Set spell checking to US english
set spelllang=en_us

" Indentation options
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

" Indentation for HTML
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

" ===============================================
" Interface
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

" Uses vim colorscheme and gnome-terminal transparency
set t_Co=256
hi Normal ctermbg=none
highlight NonText ctermbg=none

" Highlight some special characters: ;.,:{}()/[]<>
highlight SpecialChars cterm=bold
match SpecialChars /;\|,\|\.\|:\|{\|}\|(\|)\|\/\|[\|]\|<\|>/


" ===============================================
" Hotkeys
" ===============================================

" Efficient way to move through your code using the Arrow Keys
map <silent> <Left> h
map <silent> <Down> gj
map <silent> <Up> gk
map <silent> <Right> l

" Remappings. 'e' goes to the end fo the line. 'b' goes to the beginning.
map e $
map b 0

" F2 toggles the number lines
map <F2> :set number!<Cr>

" F5 refreshes vim. Little buggy
map <F5> :source ~/.vimrc<Cr>

" '\+arrows' resize a vim pane
map <Leader><Up> :resize +5<Cr>
map <Leader><Down> :resize -5<Cr>
map <Leader><Left> :vertical resize +5<Cr>
map <Leader><Right> :vertical resize -5<Cr>

" FIXME: Searching in visual block must uses only '/'
" Press '\/' with a selected visual block, to search in that block
vnoremap <Leader>/ <Esc>/\%V

" Press 's' to search character using plugin EasyMotion
nmap s <Plug>(easymotion-s)

" Double-clicking with the LeftMouse add a coloured mark into that word. Uses the plugin EasyMark
map <2-LeftMouse> \m

" Press ENTER in a selected visual block to align it. Uses the plugin EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Format a XML line (1 by 1) via visual mode clicking on '\x'. Custom func.
map <silent> <leader>x :!xmllint --format --recover - 2>/dev/null<cr>

" Press 'F8' to toggle the Tagbar. Doesn't require a processed tag for it
nmap <F8> :TagbarToggle<CR>

" Make 'CTRL+Space' to Omnicomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
	\ "\<lt>C-n>" :
	\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
	\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
	\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Toggle Spell Checking
nmap <silent> <leader>s :set spell!<CR>


" ===============================================
" My Functions
" ===============================================

" PrettyXML: Formats a line of unformatted XML for you
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


" SetDotFilesForJs: Generate a exhuberant ctags for you, for javascript projects
function! SetDotFilesForJs()
	!find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags && cp ~/vim/.tern-project .
endfunction

command! JsProject call SetDotFilesForJs()


" ===============================================
" Plugin Configs
" ===============================================

" syntastic
" =============== 
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


" vim-javascript
" =============== 
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 0


" vim-css3-syntax
" =============== 
setlocal iskeyword+=-

augroup VimCSS3Syntax
	autocmd!

	autocmd FileType css setlocal iskeyword+=-
augroup END


" delimitMate
" =============== 
let delimitMate_matchpairs = "(:),[:],{:}"


" LargeFile
" =============== 
let g:LargeFile = 0.5


" ultisnips
" =============== 
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"
let g:UltiSnipsJumpBackwardTrigger="<C-f>"


" supertab
" =============== 
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 0


" YouCompleteMe
" =============== 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_blacklist = {}
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']


" vim-jsdoc
" =============== 
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1


" lightline.vim
" =============== 
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ 'component': {
	\   'readonly': '%{&readonly?"READ-ONLY":""}',
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '|', 'right': '|' }
	\ }


" ===============================================
