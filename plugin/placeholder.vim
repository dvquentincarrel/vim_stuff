" Allow for easy placeholder modification, and more extensible abbreviations
let g:placeholder = '<%%.\{-}%%>'
nnoremap <leader>p :call search(g:placeholder)<cr>cf>
nnoremap <leader>P :call search(g:placeholder, 'b')<cr>cf>
