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
        let b:curTime = trim(system('date +%T'))
        if(b:nextTask == '')
            return 0
        endif
        " If on a closed fold, we only care about the last line of the fold
        let l:linenum = foldclosedend(".") > 0 ? foldclosedend(".") : line(".")
        let l:base_line = getline(l:linenum)

        let l:closed_line = substitute(l:base_line, '\v($| #)', ' '.b:curTime.'\1', '')
        let l:new_line = substitute(l:base_line, '\v( *-).*', '\1 '.b:curTime.' # '.b:nextTask, '')
        call setline(l:linenum, l:closed_line)
        call append(l:linenum, l:new_line)

        call cursor(l:linenum+1, col("."))
    endfunction

endfunction

