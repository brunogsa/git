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

" 'b' goes to the beginning of a line. 'e' to the end of the line.
map b 0
map e $

" F2 toggles the number lines
map <F2> :set number!<Cr>

" Search only in visual selection
vnoremap / <Esc>/\%V

" PrettyXML: Format a line of XML
vmap <Leader>fx :!xmllint --format --recover - 2>/dev/null<CR>

" PreetyJSON: Format a line of JSON
vmap <Leader>fj :!python -m json.tool<CR>

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


" nerdcommenter
" =============== 
map '' <Leader>c<Space>
vmap '' <Leader>c<Space>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


" delimitMate
" =============== 
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1


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


" vim-instant-markdown
" =============== 
let g:instant_markdown_autostart = 1


" markdown-syntax
" =============== 
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1


" vim-mark
" =============== 

" Double-clicking with the LeftMouse add a coloured mark into that word. Uses the plugin EasyMark
map <Leader>h \m
vmap <Leader>h \m
map <2-LeftMouse> \m

" Maximum colors available
let g:mwDefaultHighlightingPalette = 'maximum'


" vim-move
" =============== 
let g:move_key_modifier = 'C'


" NERDTree
" =============== 
map <F7> :NERDTreeToggle<CR>


" wildfire.vim
" =============== 
let g:wildfire_objects = ["iw", "i'", 'i"', "i)", "i]", "i}", "it", "ii", "ip"]

" This selects the next closest text object.
map <Space> <Plug>(wildfire-fuel)

" This selects the previous closest text object.
vmap <Backspace> <Plug>(wildfire-water)


" yaifa
" =============== 
let g:yafa_tab_width = 4
let g:yafa_indentation = 1


" vim-argumentative
" =============== 
nmap < <Plug>Argumentative_MoveLeft
nmap > <Plug>Argumentative_MoveRight


" vim-easymotion
" =============== 

" Press 's' to search character using plugin EasyMotion
nmap s <Plug>(easymotion-s)


" tagbar
" =============== 

" Press 'F8' to toggle the Tagbar. Doesn't require a processed tag for it
nmap <F8> :TagbarToggle<CR>


" splitjoin.vim
" =============== 
nmap <Leader>ls :SplitjoinSplit<CR>
nmap <Leader>lj :SplitjoinJoin<CR>


" SwapText
" =============== 
vmap <Leader>s <Leader>x

" ===============================================
