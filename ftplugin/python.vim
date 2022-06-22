if exists("b:loaded_ec_python_plugin")
    finish
endif
let b:loaded_ec_python_plugin = 1

let g:pyindent_open_paren = '&sw'

" main function and if main guard
iabbrev <buffer> main! def main():<CR>pass<CR><CR><CR>if __name__ == '__main__':<CR>main()

" if main guard
iabbrev <buffer> ifm! if __name__ == '__main__':

" parse_arguments
iabbrev <buffer> args! def parse_arguments():<CR>parser = argparse.ArgumentParser()<CR>return parser.parse_args()

