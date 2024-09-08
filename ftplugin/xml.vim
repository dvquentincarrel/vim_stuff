setlocal foldmethod=expr
setlocal shiftwidth=4
setlocal tabstop=4
let b:altmakeprg='silent Inject'

nmap <buffer> <leader># I<!-- <C-o>$ --><esc><<
vmap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>
