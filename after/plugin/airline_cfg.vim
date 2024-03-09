if exists(':AirlineExtensions')
    let g:airline_extensions = ['fugitiveline', 'fzf', 'quickfix', 'tagbar', 'undotree']
    let g:airline_powerline_fonts = 0
    let g:airline_symbols_ascii = 1

    let g:airline_section_y = ''
    let g:airline_section_c = '%{trim(system("shorten_path ".getcwd()." 2"))}     %f'

    let airline#extensions#nvimlsp#error_symbol = ''
    let airline#extensions#nvimlsp#warning_symbol = ''
    let airline#extensions#nvimlsp#show_line_numbers = 1
    let airline#extensions#nvimlsp#open_lnum_symbol = ':'
    let airline#extensions#nvimlsp#close_lnum_symbol = ''
endif
