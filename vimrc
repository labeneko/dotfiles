set nocompatible

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

set ambiwidth=double

set hlsearch
set showcmd
set title
set number
set ruler

set laststatus=2
set list
set listchars=tab:\ \ ,extends:<,trail:-
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set incsearch
set ignorecase
set smartcase

set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set matchtime=1
set showmatch
set showmode
set wildmenu
set shortmess+=I

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab
set hidden
set nobackup
set wrapscan
set cursorline
set autoread
set scroll=3
set scrolloff=15
set whichwrap=b,s,h,l,<,>,[,]

colorscheme darkblue
filetype plugin on
filetype indent on
syntax on

if has("autocmd")
  "autocmd!
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
  autocmd QuickFixCmdPost vimgrep cw
  autocmd BufNewFile,BufRead *.as   set filetype=actionscript
  autocmd BufNewFile,BufRead *.mxml set filetype=mxml
  autocmd BufNewFile,BufRead *.go   set filetype=go
  autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
  autocmd FileType php let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/php.dict'
endif

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
nmap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
nmap sk <C-W>k
nmap sj <C-W>j
nnoremap j gjzz
nnoremap k gkzz
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <expr><Up> pumvisible() ? neocomplcache#close_popup()."\<Up>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? neocomplcache#close_popup()."\<Down>" : "\<Down>"
vmap _ :w !nkf -Ws\|pbcopy<CR><CR>

let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
let g:AutoComplPop_IgnoreCaseOption=1
let g:AutoComplPop_NotEnableAtStartup=1
let g:NeoComplCache_EnableAtStartup=1
let g:NeoComplCache_SmartCase=1
let g:NeoComplCache_PreviousKeywordCompletion=1
let g:NeoComplCache_EnableInfo=1
let g:NeoComplCache_EnableCamelCaseCompletion=1
let g:NeoComplCache_EnableUnderbarCompletion=1
let g:NeoComplCache_MinSyntaxLength=3
let g:NeoComplCache_SkipInputTime='0.5'
let g:NeoComplCache_ManualCompletionStartLength=0
let g:NeoComplCache_DictionaryFileTypeLists = {
       \ 'default' : '',
       \ 'vimshell' : $HOME.'/.vimshell_hist',
       \ 'scheme' : $HOME.'/.gosh_completions'
       \ }
if !exists('g:NeoComplCache_KeywordPatterns')
  let g:NeoComplCache_KeywordPatterns = {}
endif
let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'
let g:NeoComplCache_SnippetsDir = $HOME.'/snippets'
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplSplitBelow=0
nmap <Space> :MBEbn<CR>
nmap <S-Space> :MBEbp<CR>

hi Pmenu ctermbg=cyan ctermfg=black
hi PmenuSel ctermbg=blue
hi PmenuSbar ctermbg=cyan
hi Folded	ctermfg=blue ctermbg=darkgrey cterm=bold term=bold
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black

