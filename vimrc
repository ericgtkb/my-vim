set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

" Fast surround with any character
Plugin 'tpope/vim-surround'

" Allow . to repeat mappings
Plugin 'tpope/vim-repeat'

" Pair insertion
Plugin 'raimondi/delimitmate'

" Airline
Plugin 'vim-airline/vim-airline'

" Color schemes
Plugin 'flazz/vim-colorschemes'

" C++ syntax
Plugin 'octol/vim-cpp-enhanced-highlight'

" Python syntax
Plugin 'vim-python/python-syntax'

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
" Syntastic mappings
nnoremap <Leader>stm :SyntasticToggleMode<CR>
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>
" End Syntastic settings

" YCM settings
let g:ycm_auto_trigger = 1
let g:ycm_goto_buffer_command = 'new-tab' 
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" YCM mappings
nnoremap <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>ydoc :YcmCompleter GetDoc<CR>
nnoremap <Leader>yrr :YcmCompleter RefactorRename<Space>
" Java only
nnoremap <Leader>yoi :YcmCompleter OrganizeImports<CR>
" End YCM settings

" DelimitMate settings
let g:delimitMate_expand_cr = 1
" End DelimitMate settings

" Java syntax settings
let g:java_highlight_all = 1
" let g:java_highlight_functions = 1
" End Java syntax settings

" C++ syntax settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
" Better but slower
let g:cpp_experimental_simple_template_highlight = 1
" Faster but doesn't work in some cases
" let g:cpp_experimental_template_highlight = 1
" End C++ syntax settings

" Python syntax settings
let g:python_highlight_all = 1
" End Python syntax settings

" End plugin settings



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

" Bash-like autocomplete
set wildmode=longest,list
set wildmenu
set nowildignorecase
set nofileignorecase
set showmatch

" No wrap
set nowrap

" Default split direction
set splitbelow
set splitright
" No resizing after closing a split
set noequalalways

set clipboard=unnamed

set termwinsize=15*0

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Make backspace work like other programs
set backspace=indent,eol,start

" Dealing with the delay of <Esc> O
set timeout timeoutlen=5000 ttimeoutlen=100

colorscheme lettuce

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
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_alto = 0
let g:netrw_preview = 1
let g:netrw_winsize = 20

" Auto commands
" Restore cursor position
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$")
    \ |   execute "normal! g`\""
    \ | endif

" Remaps
nnoremap <Leader>hl :set hlsearch<CR>
nnoremap <Leader>nhl :set nohlsearch<CR>
nnoremap <Leader>ic :set ignorecase<CR>
nnoremap <Leader>nic :set noignorecase<CR>
nnoremap <Leader>num :set number relativenumber<CR>
nnoremap <Leader>nnum :set nonumber norelativenumber<CR>
nnoremap <Leader>* *N
nnoremap <Leader># #N
" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" No arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

