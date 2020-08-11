"===Vundle=============================================================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Defaul plugins for Vundle itself
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"---Plugins-------------------------------------------------------------------
" Nerdtree
Plugin 'scrooloose/nerdtree'

" Syntax plugins
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'

" TypeScript
Plugin 'Quramy/tsuquyomi'

" Indent Line (not working on mac)
" Plugin 'Yggdroot/indentLine'

" Eslint plugin
" Plugin 'w0rp/ale'

" tag match display
" Plugin 'Valloric/MatchTagAlways'

" Color preview
Plugin 'ap/vim-css-color'

" Surround helpers
Plugin 'tpope/vim-surround'

" Comment helpers
Plugin 'tpope/vim-commentary'

" Support dot repeat for some plugins
Plugin 'tpope/vim-repeat'

" Multicursor
Plugin 'terryma/vim-multiple-cursors'

" Fuzzy finder and find all
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Status line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'

" Colorscheme
" Plugin 'chriskempson/base16-vim'
Plugin 'saj/base16-vim'

"---EndPlugins----------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"===NormalConfig=============================================================
" Auto update vim colorscheme base on the terminal color(must both use base16)
" Make sure to install base 16 shell for this by adding:
" To change colorscheme: type base16_ then hit tab to choose name in terminal.
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Indent"
set expandtab 		" convert tab to spaces
set tabstop=2
set shiftwidth=2
set autoindent		" autoindent when starting new line

" Change ESC to jj
inoremap jj <ESC>

" Buffer switch
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Disable sound
set visualbell 
set t_vb=

" Syntax
syntax on

" Auto read/change from disk (when change from git also)
set autoread
set updatetime=1000 				" CursorHold time as 1s
au CursorHold * checktime 	" check after inactivity time (CursorHold) in normal mode

" Line number
set number

" Pane Split direction
set splitbelow
set splitright

" Search
set incsearch
set hlsearch

" Clipboard copy
set clipboard=unnamed

" Set 256 colors
" let &t_Co=256

"---Ale config for react---------------------------------------------------
let g:ale_fixers = {
      \'javascript': ['prettier'],
      \'typescript': ['prettier'],
      \'python': ['black']
      \}
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'python': []}
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_set_balloons = 1
let g:ale_sign_column_always = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"---TypeScript syntax config------------------------------------------------
let g:typescript_indent_disable = 0   " Disable auto indent

" Allow MatchTagAlways to highlight jxs
let g:mta_filetypes = {
			\ 'javascript.jxs' : 1,
			\}

" set filetypes as typescript.tsx
" autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

"---TSX config-------------------------------------------------------------

"---Airline config---------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_section_x=''
let g:airline_section_y=''

let g:airline#extensions#tabline#enabled = 1	" enable buffer line
let g:airline#extensions#tabline#formatter = 'unique_tail'	" style for buffer tab name

let g:airline#extensions#ale#enabled = 1	" enable ale error
" let g:airline#extensions#ale#error_symbol = 'Err: ' 
" let g:airline#extensions#ale#warning_symbol = 'Warn: '
" let g:airline#extensions#ale#checking_symbol = 'Checking'
" let g:airline#extensions#ale#open_lnum_symbol = ' (Line '
" let g:airline#extensions#ale#close_lnum_symbol = ')'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEError ctermbg=DarkGray ctermfg=red
" highlight ALEError ctermbg=Black ctermfg=red cterm=underline

"---Nerdtree config-------------------------------------------------------
" always open on vim start
" autocmd vimenter * NERDTree
" toggle tree and open current file dir
map <C-\> :NERDTreeToggle %<CR>

"---Default fzf layout---------------------------------------------------
" - down / up / left / right
" let g:fzf_layout = { 'down': '~50%' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit'}

"---Indent Line config-----------------------------------------------------
let g:indentLine_color_gui = '#4c4c4b'
let g:indentLine_char = 'c' " Allow ASCII char
let g:indentLine_char_list = ['┊']

"---Vim jsx-----------------------------------------------------------------
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1
