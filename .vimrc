" change leader key
let mapleader = ','
let g:mapleader = ','

" map ; to :
nnoremap ; :

" disable mouse
set mouse-=a

" disable direction key
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" use H, L to replace ^ $
noremap H ^
noremap L $

syn on  " enable syntax highlighting
set laststatus=2 " always display the status line
set tabstop=8 " number of visual spaces per TAB
set softtabstop=4  " number of spaces in tab when editing
set shiftwidth=4 " auto-indent amount when using cindent
set expandtab " tabs are spaces
set smarttab " smart tabs
set autoindent " auto indent
set smartindent " smart indent
set number " show line numbers
set numberwidth=5 " show up to 99999 lines
set ruler "  display the cursor position on the last line of the screen
set backupdir=/tmp " backup file directory
set directory=/tmp " temporary file directory
set ignorecase " use case insensitive search
set hlsearch " highlight matches when typing
set backspace=2 " allow delete in insert mode
set scrolloff=3 " set rows left when using cursor
let loaded_matchparen = 1 " disable (){}... match hightlight
set autoread " auto reload file if edited
set magic " turn on magic when using regular expression
" set foldmethod=syntax " fold based on indent level

" highlight the current line
" set cursorline

" set color of number column on cursorline
" hi cursorlinenr ctermfg=white

" set search results color
hi Search term=standout ctermfg=0 ctermbg=3


" settings for plugins
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'

Plugin 'airblade/vim-gitgutter'

Plugin 'ap/vim-css-color'

Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<CR>

Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
" remove search results highlight last time
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plugin 'junegunn/goyo.vim'
nnoremap <Leader>f :Goyo<CR>
" enable line number in goyo
let g:goyo_linenr = 1

Plugin 'junegunn/vim-easy-align'
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
      let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom, order:btt, min:1, max:10, results:20'

Plugin 'kien/rainbow_parentheses.vim'
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
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesLoadChevrons

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)

" Plugin 'Lokaltog/vim-powerline'

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
" auto start tagbar at start
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'


Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/nerdtree'
" autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


Plugin 'scrooloose/nerdcommenter'
" Add space when comment
let NERDSpaceDelims=1
filetype plugin on

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=E402,E501"


Plugin 'SirVer/ultisnips'

Plugin 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>

Plugin 'terryma/vim-expand-region'

Plugin 'terryma/vim-multiple-cursors'
" let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plugin 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

Plugin 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()}

Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-surround'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_theme='papercolor'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

Plugin 'vim-scripts/matchit.zip'

Plugin 'yggdroot/indentline'
let g:indentLine_color_term = 239
map <leader>l ::IndentLinesToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
