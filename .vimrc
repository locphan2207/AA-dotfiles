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
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'chemzqm/vim-jsx-improve'

" Eslint plugin
Plugin 'w0rp/ale'

" Tag Match display
Plugin 'Valloric/MatchTagAlways'

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
Plugin 'chriskempson/base16-vim'

"---EndPlugins----------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"===NormalConfig=============================================================
" Auto update vim colorscheme base on the terminal color(must both use base16)
" Make sure to install base 16 shell for this by adding:
" To change colorscheme: type base 16 colorscheme name in terminal.
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

" Syntax
syntax enable

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

" Set 256 colors
" let &t_Co=256

"---Ale config for react---------------------------------------------------
let g:ale_fixers = {'javascript': ['eslint']} ", 'python': ['yapf']}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%] %s'

" Allow MatchTagAlways to highlight jxs
let g:mta_filetypes = {
			\ 'javascript.jxs' : 1,
			\}

"---Airline config---------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_section_x=''
let g:airline_section_y=''

let g:airline#extensions#tabline#enabled = 1	" enable buffer line
let g:airline#extensions#tabline#formatter = 'unique_tail'	" style for buffer tab name
let g:airline#extensions#ale#enabled = 1	" enable ale error
"---Nerdtree config-------------------------------------------------------
" always open on vim start
" autocmd vimenter * NERDTree
" toggle tree and open current file dir
map <C-\> :NERDTreeToggle %<CR>
