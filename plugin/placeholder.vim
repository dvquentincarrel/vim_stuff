" Allow for easy placeholder modification, and more extensible abbreviations
let g:placeholder = '_%%.\{-}%%_'
nnoremap <expr><leader>p ':call search(g:placeholder)<cr>cf'.g:placeholder[-1:]
nnoremap <expr><leader>P ':call search(g:placeholder, "b")<cr>cf'.g:placeholder[-1:]
