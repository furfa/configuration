syntax on


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'klen/python-mode'
Plugin 'ryanoasis/vim-devicons'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

Plugin 'wakatime/vim-wakatime'

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

let g:indentLine_char = '.'
let g:indentLine_color_term = 239

" IndentLine {{
let g:indentLine_char = '.'
let g:indentLine_first_char = '.'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

set t_Co=256
let g:airline_powerline_fonts = 0

" Russian support
set encoding=UTF-8
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
"highlight Comment ctermfg=green

set mouse=a
" colorscheme gruvbox 
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
