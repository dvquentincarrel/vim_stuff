let b:altmakeprg='silent Inject'
command PyFormat !black -S %
let b:formatter = 'PyFormat'

nnoremap <buffer> <F6> :silent !python "%:p"&<cr>
nnoremap <buffer> <F18> :tab term python -i "%:p"<cr>

inoreabbrev <buffer> ipdbi import ipdb; ipdb.set_trace()
inoreabbrev <buffer> pdbi import pdb; pdb.set_trace()
inoreabbrev <buffer> pudbi import pudb; pudb.set_trace()

" Make every function print its name when called
command PrintFunc g/def \w\+(/norm ^wyiwoprint('"')

" Make every function print its stack position when called
command PrintStack g/def \w\+(/put ='stack_depth()' | g/stack_depth()/norm ==

" Template for func to print stack positions
inoreabbrev <buffer> sp_stackdepth 
\def stack_depth(name):
\<CR>print(len(inspect.stack())*'  '+'%s'%(name))

" Docstring template
inoreabbrev <buffer> doc; 
\"""{% Summary %}
\<CR>
\<CR>:param {% ParamName %}: {% ParamDescription %}
\<CR>:type {% ParamName %}: {% ParamType %}
\<CR>:return: {% ReturnDescription %}
\<CR>:rtype: {% ReturnType %}
\<CR>:raises {% ErrType %}: {% ErrorDescription %}
\<CR>"""<Esc>7k

if line('$') >= 5000
    let b:coc_enabled=0
endif
