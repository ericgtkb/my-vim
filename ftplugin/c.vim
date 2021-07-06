if exists("b:loaded_ec_c_plugin")
    finish
endif
let b:loaded_ec_c_plugin = 1

" Common stuff for both c and cpp files
" No indent for extern C or C++
set cinoptions+=E-s

command! -nargs=1 ECHeaderGaurd let b:header_name = toupper(<q-args>) |
    \ execute "normal! ggi#ifndef " . b:header_name . "\<CR>#define "
    \ . b:header_name . "<CR>\<Esc>Go\<Esc>o#endif  // " . b:header_name . "\<Esc>"

nnoremap <Leader>hg :ECHeaderGaurd 

" Prevent cpp files from loading c only stuff
if (&ft != 'c')
    finish
endif

" main with args, assuming delimitMate is used.
iabbrev main! int main(int argc, char **argv) {<CR>return 0;
" main without args.
iabbrev mainv! int main(void) {<CR>return 0;

