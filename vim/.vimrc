syntax on
set mouse=a
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set nocompatible              " be iMproved, required
set hidden
filetype off                  " required

let mapleader="\\"

" X clipboard support
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <C-r><C-o>+

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'

" Plugin 'bling/vim-airline' 
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
"Plugin 'davidhalter/jedi-vim'
Plugin 'jpalardy/vim-slime'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'


Plugin 'connorholyday/vim-snazzy'
Plugin 'mhinz/vim-janah'
Plugin 'farmergreg/vim-lastplace'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'rafi/awesome-vim-colorschemes'

Plugin 'wakatime/vim-wakatime'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'

" Plugin 'francoiscabrol/ranger.vim'
Plugin 'mhinz/vim-startify'

call vundle#end()            " required
filetype plugin indent on    " required

" IndentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}

set t_Co=256

" Russian support
set encoding=UTF-8
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" set background=dark

if has('gui_running') || has('nvim')
    hi Normal 		guifg=#f6f3e8 guibg=#242424
else
    " Set the terminal default background and foreground colors, thereby
    " improving performance by not needing to set these colors on empty cells.
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
    let &t_te = &t_te . "\033]110\007\033]111\007"
endif
let &t_ut=''


" set termguicolors
" let g:SnazzyTransparent = 1
" colorscheme snazzy
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah


" Codding settings
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set rnu
set nonu
set hlsearch
set incsearch
set ruler
set nowrap

" set cursorline
map <Leader> <Plug>(easymotion-prefix)

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1
let g:slime_cell_delimiter = "#%%"
nmap <Leader><Leader>s <Plug>SlimeSendCell

" JS
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

let g:ycm_show_diagnostics_ui = 0
autocmd BufNewFile,BufRead *.jsx set filetype=javascript


" let g:ycm_enable_diagnostic_signs = 0
set signcolumn=no
" highlight YcmErrorLine ctermfg=Red ctermbg=NONE guibg=NONE

" YouCompleteMe python
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_interpreter_path = '/usr/bin/ipython'
map <Leader><Leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Ultisnips.vim python
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

