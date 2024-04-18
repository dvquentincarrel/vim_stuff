" Which Edit, to edit scripts without having to find where they are
function! Wedit(executable_name)
    let filepath = resolve(system('which '.a:executable_name))
    if !len(filepath)
        echo "File ".a:executable_name." not found" | echohl ErrorMsg
    else
        exec 'tabe '.filepath
    endif
endfunction
command! -nargs=1 -complete=shellcmd Wedit :call Wedit('<args>')

" Work with columnated data
function! Columns(mode)
    if a:mode == 'extract'
        let l:num = input('Column number: ', "1")
        exec "silent '<,'>!awk '{print $".l:num."}'"
    elseif a:mode == 'columnize'
        '<,'>!column -t -s' '
    endif
endfunction
vmap <leader>ce :<C-U>call Columns('extract')<CR>
vmap <leader>cc :<C-U>call Columns('columnize')<CR>
