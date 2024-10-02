setlocal foldmethod=expr
compiler xmllint
setlocal shiftwidth=4
setlocal tabstop=4
let b:altmakeprg='make! inject'

nmap <buffer> <leader># I<!-- <C-o>$ --><esc><<
vmap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>
