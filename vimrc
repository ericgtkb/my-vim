set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Synastic
Plugin 'vim-syntastic/syntastic'

" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

" Fast surround with any character
Plugin 'tpope/vim-surround'

" Allow . to repeat mappings
Plugin 'tpope/vim-repeat'

" Pair insertion
Plugin 'raimondi/delimitmate'

" Ariline
Plugin 'vim-airline/vim-airline'

" Color schemes
Plugin 'flazz/vim-colorschemes'

" NerdTree, gitgutter, fugitive??

call vundle#end()
filetype plugin indent on
" End Vundle setup


" Plugin settings
" Syntastic settings
" These should be disabled when using Airline
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use YCM for java
let g:syntastic_java_checkers = []
let g:syntastic_python_checkers = ['flake8']
" End Syntastic settings

" YCM settings
let g:ycm_auto_trigger = 1
let g:ycm_goto_buffer_command = 'new-tab' 
let g:ycm_autoclose_preview_window_after_insertion = 1

" YCM mappings
nnoremap <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <Leader>ydoc :YcmCompleter GetDoc<CR>
nnoremap <Leader>yrr :YcmCompleter RefactorRename<Space>
" Java only
nnoremap <Leader>yoi :YcmCompleter OrganizeImports<CR>
" End YCM settings

" DelimitMate settings
let g:delimitMate_expand_cr = 1
" End DelimitMate settings

" End pulgin settings



" My settings
syntax on
set number
set relativenumber
set incsearch
set hlsearch
set encoding=utf-8

" Tab options
set expandtab
set tabstop=4
set shiftwidth=4

set autoindent
set showcmd
set wildmenu
set showmatch

" No wrap
set nowrap

" Default split direction
set splitbelow
set splitright

set clipboard=unnamed

set termwinsize=15x0

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Make backspace work like other programs
set backspace=indent,eol,start

" Dealing with the delay of <Esc> O
set timeout timeoutlen=5000 ttimeoutlen=100

colorscheme darkglass

set cursorline
set cursorcolumn
set colorcolumn=80,120

set t_Co=256

hi CursorLine cterm=NONE ctermbg=233
hi CursorColumn cterm=NONE ctermbg=233
hi ColorColumn cterm=NONE ctermbg=240

" netrw tree view as default"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Custom commands
" File explore
command! Vfs topleft Vexplore

" Remaps
nnoremap <Leader>hl :set hlsearch<CR>
nnoremap <Leader>nhl :set nohlsearch<CR>
nnoremap <Leader>ic :set ignorecase<CR>
nnoremap <Leader>nic :set noignorecase<CR>
nnoremap <Leader>* *N
nnoremap <Leader># #N


" No arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

