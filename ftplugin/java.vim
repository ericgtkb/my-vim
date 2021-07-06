if exists("b:loaded_ec_java_plugin")
    finish
endif
let b:loaded_ec_java_plugin = 1

" main method, assuming delimitMate is on
iabbrev <buffer> main! public static void main(String[] args) {<CR>
