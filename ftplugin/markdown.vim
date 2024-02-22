setlocal foldmethod=indent
setlocal tabstop=2
setlocal shiftwidth=2

nnoremap <buffer> <leader># I<!-- <C-o>$ --><esc><<
vnoremap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>

nnoremap <buffer> <F6> :exec 'silent w !makemd -' \| redraw!<cr>
nnoremap <buffer> <F8> :exec 'silent w !makemd - %.html' \| redraw!<cr>
