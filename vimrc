syntax on
set number
set relativenumber
set incsearch
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set showcmd
set wildmenu
set showmatch

"Default split direction
set splitbelow
set splitright

set clipboard=unnamed

filetype indent plugin on

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Make backspace work like other programs
set backspace=indent,eol,start

" Dealing with the delay of <Esc> O
set timeout timeoutlen=5000 ttimeoutlen=100

set cursorline
set cursorcolumn
set colorcolumn=80

hi CursorLine cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
hi ColorColumn cterm=NONE ctermbg=240

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

" Simple implementation for pair completion
function! PairCompOn()
    inoremap {      {}<Left>
    inoremap {<CR>  {<CR>}<Esc>O
    inoremap {{     {
    inoremap {}     {}

    inoremap (      ()<Left>
    inoremap (<CR>  (<CR>)<Esc>O
    inoremap ((     (
    inoremap ()     ()

    inoremap [      []<Left>
    inoremap [<CR>  [<CR>]<Esc>O
    inoremap [[     [
    inoremap []     []

    inoremap '      ''<Left>
    inoremap ''     ''

    inoremap "      ""<Left>
    inoremap ""     ""
endfunction

" Turn off pair completion
function! PairCompOff()
    iunmap {
    iunmap {<CR>
    iunmap {{
    iunmap {}

    iunmap (
    iunmap (<CR>
    iunmap ((
    iunmap ()

    iunmap [
    iunmap [<CR>
    iunmap [[
    iunmap []

    iunmap '
    iunmap ''

    iunmap "
    iunmap ""
endfunction

call PairCompOn()

