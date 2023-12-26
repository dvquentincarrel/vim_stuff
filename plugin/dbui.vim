command -nargs=1 AddDB call AddDB_(<args>)

function! AddDB_(dbname)
    let filepath = expandcmd(g:db_ui_save_location.'/connections.json')
    let dbentry = '{"url":"postgresql://'.$DB_PW.'@localhost/'.a:dbname.'", "name":"'.a:dbname.'"}'
    let output = systemlist(['jq', '. |= . + ['.dbentry.']', filepath])
    call writefile(output, filepath)
    return output
endfunction
