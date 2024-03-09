" Allow for easy placeholder modification, and more extensible abbreviations
let g:placeholder = '{%.\{-}%}'
nnoremap <expr><leader>p ':call search(g:placeholder)<cr>"_cf'.g:placeholder[-1:]
nnoremap <expr><leader>P ':call search(g:placeholder, "b")<cr>"_cf'.g:placeholder[-1:]
