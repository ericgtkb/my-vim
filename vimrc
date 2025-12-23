" Vim configuration for Vim + Neovim + VSCode-Neovim
" Environment detection
let s:is_vscode = exists('g:vscode')
let s:is_nvim = has('nvim')
let s:is_vim = !s:is_nvim

" Plugins
call plug#begin()

" Common Plugins
" Fast surround with any character
Plug 'tpope/vim-surround'
" Allow . to repeat mappings
Plug 'tpope/vim-repeat'
" Pair insertion
Plug 'raimondi/delimitmate'

" Syntax plugins - safe to keep in VSCode as well
" C++ syntax
Plug 'octol/vim-cpp-enhanced-highlight'
" Java syntax
Plug 'uiiaoo/java-syntax.vim'
" Python syntax
Plug 'vim-python/python-syntax'
" Javascript
Plug 'pangloss/vim-javascript'
" JSX syntax
Plug 'maxmellon/vim-jsx-pretty'
" Typescript
Plug 'herringtondarkholme/yats.vim'


" Common for Vim and Neovim but not VSCode
if !s:is_vscode
  " CoC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Indent line
  Plug 'yggdroot/indentline'
  " Airline
  Plug 'vim-airline/vim-airline'

  " Go - in VSCode use the Go extension instead
  Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

  " Copilot
  Plug 'github/copilot.vim'
else
  " VSCode-only plugins - most likely none
endif

" Neovim-only - not VSCode
if s:is_nvim && !s:is_vscode
  " Color schemes
  Plug 'folke/tokyonight.nvim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'projekt0n/github-nvim-theme'

  " Nerd fonts
  Plug 'nvim-tree/nvim-web-devicons'
  " File explorer
  Plug 'nvim-tree/nvim-tree.lua'

  " For CopilotChat
  Plug 'nvim-lua/plenary.nvim'
  " CopilotChat
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
endif

" Vim-only
if s:is_vim
  " Color schemes
  Plug 'flazz/vim-colorschemes'
  " Nerd fonts
  Plug 'ryanoasis/vim-devicons'
  " Nerd tree
  Plug 'preservim/nerdtree'
  " Nerd tree color icons
  Plug 'lambdalisue/vim-glyph-palette'

  " CopilotChat
  Plug 'DanBradbury/copilot-chat.vim'
endif

call plug#end()

" Settings
" Common settings
set nocompatible
filetype plugin indent on

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

" Whether to disable mouse
set mouse=

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Make backspace work like other programs
set backspace=indent,eol,start

" Dealing with the delay of <Esc> O
set timeout timeoutlen=5000 ttimeoutlen=100

" Restore cursor position
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$")
    \ |   execute "normal! g`\""
    \ | endif

" Indentation for file types
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" vim-go hadles tab indentation, uncomment for lager tab size.
" autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

" Vim + Neovim settings (Not VSCode)
if !s:is_vscode
  " Clipboard
  if system('uname -s') == "Darwin\n"
    set clipboard=unnamed " macOS
  else
    set clipboard=unnamedplus " Linux
  endif

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
else
  " VSCode-only settings
endif


" Neovim-only settings - not VSCode
if s:is_nvim && !s:is_vscode
  colorscheme kanagawa-wave

  " Terminal size
  autocmd TermOpen * resize 15

  " Mappings
  " Make nvim terminal behave like vim
  tnoremap <C-w>N <C-\><C-n>
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
endif

" Vim-only settings
if s:is_vim
  set ttymouse=
  set termwinsize=15*0

  colorscheme lettuce

  " Enable nerd tree color icons
  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType fall-list call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END
endif

" Plugin settings

" Vim + Neovim, not VSCode
if !s:is_vscode
  " CoC settings
  try 
    source ~/.vim/coc-config.vim
    let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-yaml',
        \ 'coc-pyright',
        \ 'coc-go',
        \ 'coc-rust-analyzer',
        \ 'coc-tsserver',
        \ 'coc-clangd',
        \ 'coc-java',
        \ 'coc-markdownlint',
        \ ]
  catch
    " No coc config.
  endtry 

  " Indent line settings
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  let g:vim_json_conceal = 0
  let g:markdown_syntax_conceal = 0

  " Copilot
  imap <silent><script><expr> <leader><CR> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
endif

" DelimitMate settings
let g:delimitMate_expand_cr = 1

" Java syntax settings
let g:java_highlight_all = 1
" let g:java_highlight_functions = 1

" C++ syntax settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
" Better but slower
let g:cpp_experimental_simple_template_highlight = 1
" Faster but doesn't work in some cases
" let g:cpp_experimental_template_highlight = 1

" Python syntax settings
let g:python_highlight_all = 1

" Remaps
" Common remaps
nnoremap <Leader>hl :set hlsearch<CR>
nnoremap <Leader>nhl :set nohlsearch<CR>
nnoremap <Leader>ic :set ignorecase<CR>
nnoremap <Leader>nic :set noignorecase<CR>
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

" Vim + Neovim remaps - not VSCode
if !s:is_vscode
  nnoremap <Leader>num :set number relativenumber signcolumn=yes \| IndentLinesToggle<CR>
  nnoremap <Leader>nnum :set nonumber norelativenumber signcolumn=no \| IndentLinesToggle<CR>

  " csv color and settings
  nnoremap <Leader>csv :set ft=csv \| set colorcolumn= \| IndentLinesToggle<CR>
else
  " Make these remaps simple
  nnoremap <Leader>num :set number relativenumber<CR>
  nnoremap <Leader>nnum :set nonumber norelativenumber<CR>

  " csv color and settings
  nnoremap <Leader>csv :set ft=csv<CR>
endif
