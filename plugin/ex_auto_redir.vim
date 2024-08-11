" Provides an easy way to manipulate the output of Ex commands
let g:last_tmp_ex_redir=""
let g:last_ex_redir=""
augroup ex_cmd_auto_redir
    autocmd!
    autocmd CmdlineEnter :
    \ redir END |
        \ if g:last_tmp_ex_redir != "" |
            \ let g:last_ex_redir = g:last_tmp_ex_redir |
        \ endif |
        \ redir => g:last_tmp_ex_redir
augroup END

" Has the advantage of capturing the whole output at once, without having to
" scroll
command! -nargs=* -complete=command Redir call ReviewLastOutput(<q-args>)
function! ReviewLastOutput(cmd)
    if a:cmd != ""
        redir => g:last_ex_redir
        silent execute a:cmd
        redir end
    endif
    if g:last_ex_redir != ""
        tabnew
        setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
        silent put =g:last_ex_redir
    else
        echo "No text to see"
    endif
endfunction
