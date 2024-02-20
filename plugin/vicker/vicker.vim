augroup vicker
    autocmd!
    autocmd BufRead time.yaml let b:vickerPath = resolve(expand('<sfile>:p:h')) | call SetupVicker()
augroup END

function! SetupVicker()
    nnoremap <buffer> <leader>t :call VickerAddTime()<cr>
    exec "vnoremap <buffer><silent> <leader>t :!python ".b:vickerPath."/vicker.py<cr>"

    function! VickerAddTime()
        " Inserts cur time on cur line and next one, sets up next task
        " Escape problematic chars
        let b:nextTask = input("Next tasks's name: ")
        let b:nextTask = escape(b:nextTask, "=!@#/%$&\\")
        if(b:nextTask == '')
            return 0
        endif
        let b:curTime = trim(system('date +%T'))
        let l:closed_line = substitute(getline("."), '\v($| #)', ' '.b:curTime.'\1', '')
        let l:new_line = substitute(getline("."), '\v( *-).*', '\1 '.b:curTime.' # '.b:nextTask, '')
        call setline(".", l:closed_line)
        call append(".", l:new_line)
        call cursor(line(".")+1, col("."))
    endfunction

endfunction

