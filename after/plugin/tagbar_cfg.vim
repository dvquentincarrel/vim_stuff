if exists(':TagbarToggle') && ! exists(':Outline')
    nmap <F4> :TagbarToggle<cr>
    let g:tagbar_position = 'leftabove vertical'
    let g:tagbar_autofocus = 1
endif
