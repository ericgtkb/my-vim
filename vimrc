call plug#begin()

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Indent line
Plug 'yggdroot/indentline'

" Fast surround with any character
Plug 'tpope/vim-surround'

" Allow . to repeat mappings
Plug 'tpope/vim-repeat'

" Pair insertion
Plug 'raimondi/delimitmate'

" Airline
Plug 'vim-airline/vim-airline'

" Color schemes
Plug 'flazz/vim-colorschemes'

" C++ syntax
Plug 'octol/vim-cpp-enhanced-highlight'

" Java syntax
Plug 'uiiaoo/java-syntax.vim'

" Python syntax
Plug 'vim-python/python-syntax'

" Javascript
Plug 'pangloss/vim-javascript'

" Python syntax
Plug 'maxmellon/vim-jsx-pretty'

"Typescript
Plug 'herringtondarkholme/yats.vim'

" Csv
Plug 'chrisbra/csv.vim'

call plug#end()

set nocompatible
filetype plugin indent on

" Plugin settings

" Import CoC settings
try 
  source ~/.vim/coc-config.vim
  let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-clangd',
      \ 'coc-java',
      \ 'coc-pyright',
      \ 'coc-tsserver',
      \ 'coc-go',
      \ 'coc-markdownlint',
      \ ]
catch
  " No coc config.
endtry 

" Indent line settings
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0


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

" Csv settings
let g:csv_delim_test = ', 	|'
" End Csv settings

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
set tabstop=2
set softtabstop=2
set shiftwidth=2

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

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Whether to disable mouse
set mouse=
set ttymouse=

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

" Indentation for file types
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Remaps
nnoremap <Leader>hl :set hlsearch<CR>
nnoremap <Leader>nhl :set nohlsearch<CR>
nnoremap <Leader>ic :set ignorecase<CR>
nnoremap <Leader>nic :set noignorecase<CR>
nnoremap <Leader>num :set number relativenumber \| IndentLinesToggle<CR>
nnoremap <Leader>nnum :set nonumber norelativenumber \| IndentLinesToggle<CR>
nnoremap <Leader>* *N
nnoremap <Leader># #N
" Highlight current column
nnoremap <Leader>hc :exe ':set colorcolumn+=' . col('.')<CR>
" Remove additional highlighted columns
nnoremap <Leader>nhc :set colorcolumn=80,120<CR>
" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" json formatting
nnoremap <Leader>json :%!python3 -m json.tool --indent 2<CR>
" csv color and settings
nnoremap <Leader>csv :set ft=csv \| set colorcolumn= \| IndentLinesToggle<CR>
" Spelling check
nnoremap <Leader>spe :spell<CR>
nnoremap <Leader>nspe :nospell<CR>

" No arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

