let b:altmakeprg='silent Inject'
command PyFormat !black -S %
let b:formatter = 'PyFormat'

nnoremap <buffer> <F6> :silent !python "%:p"&<cr>
nnoremap <buffer> <F18> :tab term python -i "%:p"<cr>

" Make every function print its name when called
command PrintFunc g/def \w\+(/norm ^wyiwoprint('"')

" Make every function print its stack position when called
command PrintStack g/def \w\+(/put ='stack_depth()' | g/stack_depth()/norm ==
