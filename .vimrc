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
" Syntax plugins
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

" Eslint plugin
Plugin 'w0rp/ale'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

"---EndPlugins----------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"===NormalConfig=============================================================
" Scheme
colorscheme onehalfdark
" colorscheme hybrid_material
" colorscheme tender
" colorscheme stellarized

" Indent
set tabstop=2
set shiftwidth=2

" Change ESC to jk
inoremap jj <ESC>

" Syntax
syntax on

" Line number
set number

" Search
set incsearch
set hlsearch

" Set 256 colors
let &t_Co=256

