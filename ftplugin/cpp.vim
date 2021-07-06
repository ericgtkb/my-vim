if exists("b:loaded_ec_cpp_plugin")
    finish
endif
let b:loaded_ec_cpp_plugin = 1

" No indent for class access modifiers, namespaces
set cinoptions+=g0,N-s

" main with args, assuming delimitMate is used.
iabbrev main! int main(int argc, char* argv[]) {<CR>return 0;
" main without args.
iabbrev mainv! int main() {<CR>return 0;

