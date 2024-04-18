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
