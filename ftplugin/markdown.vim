function! s:GetMDFold(lnum)
    let line_content = getline(a:lnum)
    if line_content[0] != '#'
        return '='
    endif
    let leading_sharps_nb = len(matchstr(line_content, '^#\+ .'))-2
    if leading_sharps_nb > 0
        return leading_sharps_nb
    else
        return '='
    endif
endfunction

setlocal foldmethod=expr
setlocal tabstop=2
setlocal shiftwidth=2

nnoremap <buffer> <leader># I<!-- <C-o>$ --><esc><<
vnoremap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>

nnoremap <buffer> <F6> :exec 'silent w !makemd -' \| redraw!<cr>
nnoremap <buffer> <F8> :exec 'silent w !makemd - %.html' \| redraw!<cr>
