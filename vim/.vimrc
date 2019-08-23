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
" Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'kristijanhusak/vim-hybrid-material'

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

" IndentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}

set t_Co=256

" Russian support
set encoding=UTF-8
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set incsearch
set ruler
"highlight Comment ctermfg=green

set mouse=a
set cursorline

set background=dark
colorscheme hybrid_reverse
let g:airline_theme = "hybrid"

if has('gui_running') || has('nvim')
    hi Normal 		guifg=#f6f3e8 guibg=#242424
else
    " Set the terminal default background and foreground colors, thereby
    " improving performance by not needing to set these colors on empty cells.
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
    let &t_te = &t_te . "\033]110\007\033]111\007"
endif
