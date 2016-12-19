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

" Auto reload vim, if file changed elsewhere
set autoread
au FocusGained,FocusLost * checktime

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

" No annoying backup files
set nobackup
set nowritebackup
set noswapfile

" Mouse only works on Normal Mode
set mouse=n

" Set spell checking to US english
set spelllang=en_us

" Efficient way to move through your code using the Arrow Keys
map <silent> <Left> h
map <silent> <Down> gj
map <silent> <Up> gk
map <silent> <Right> l

" ===============================================
" Interface
" ===============================================

syntax on

" Add a line above the cursor
set cursorline

" Indentation options
set autoindent
set smartindent
set cindent
set preserveindent
set copyindent
set shiftround
set smarttab
set wrap

" Uncomment it for Spaces, instead of Tabs
set expandtab

" The size of your indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Indentation for HTML
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

" Automatically set wrap when starting a vim diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" True Colors
set t_Co=256

" Colorscheme
set background=dark
colorscheme wasabi256

" Transparency in some terminals
hi Normal ctermbg=none
highlight NonText ctermbg=none

" Colorscheme for vimdiff
if &diff
  colorscheme jellybeans
endif

" General vision
set lbr
set tw=250
set scrolloff=5
hi MatchParen cterm=bold ctermbg=lightblue ctermfg=black

" Status Line
set noruler
set laststatus=2

" Highlight some special characters: ;.,:/[]=
highlight SpecialChars cterm=bold
match SpecialChars /;\|,\|\.\|:\|\/\|[\|]\|=/

" Hybrid numbers column, active by default
set relativenumber
set number

" ===============================================
" Hotkeys
" ===============================================
" 'b' goes to the beginning of a line. 'e' to the end of the line.
map b 0
map e $

" F2 toggles the number lines
map <F2> :set number!<Cr>:set relativenumber!<Cr>

" Search only in visual selection
vnoremap / <Esc>/\%V

" PrettyXML: Format a line of XML
vmap <Leader>fx :!xmllint --format --recover - 2>/dev/null<CR>

" PrettyJSON: Format a line of JSON
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

" JavaScript Checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'


" vim-javascript
" ===============
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 0


" vim-json
" ===============
let g:vim_json_syntax_conceal = 0


" javascript-librariers-syntax
" ===============
let g:used_javascript_libs = 'jquery,angularjs,react,flux,chai'


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


" YouCompleteMe
" ===============
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist = {}
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_use_ultisnips_completer = 0


" vim-jsdoc
" ===============
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1


" lightline.vim
" ===============
let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component': {
        \   'readonly': '%{&readonly?"READ-ONLY":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
        \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '|', 'right': '|' }
        \ }


" vim-instant-markdown
" ===============
let g:instant_markdown_autostart = 0


" markdown-syntax
" ===============
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1


" vim-mark
" ===============
map <Leader>h \m
vmap <Leader>h \m
map <2-LeftMouse> \m

" Maximum colors available
let g:mwDefaultHighlightingPalette = 'maximum'


" NERDTree
" ===============
map <F8> :NERDTreeToggle<CR>


" yaifa
" ===============
let g:yafa_tab_width = 2
let g:yafa_indentation = 1


" splitjoin.vim
" ===============
nmap <Leader>ls :SplitjoinSplit<CR>
nmap <Leader>lj :SplitjoinJoin<CR>


" indentlines
" ===============
let g:indentLine_char = '┆'
let g:indentLine_color_term = 32


" limelight.vim
" ===============
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_paragraph_span = 3
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'


" vim-sneak
" ===============
let g:sneak#s_next = 1

"'s', sneak with 2 chars
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T


" vim-better-whitespace
" ===============
" These file types automatically remove trailling spaces on save
autocmd FileType javascript,html autocmd BufWritePre <buffer> StripWhitespace


" SyntaxComplete
" ===============
" Enable omni completion based on syntax highlighting, on languages that don't have it yet
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \ 	setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

" ===============================================
