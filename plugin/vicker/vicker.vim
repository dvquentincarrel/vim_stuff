augroup vicker
    autocmd!
    autocmd BufRead time.yaml let b:vickerPath = resolve(expand('<sfile>:p:h')) | call SetupVicker()
augroup END

function! SetupVicker()
    nnoremap <buffer> <leader>t :call VickerAddTime()<cr>
    nnoremap <buffer> <leader>p :call VickerAddTime(0)<cr>
    exec "vnoremap <buffer><silent> <leader>t :!python ".b:vickerPath."/vicker.py<cr>"

    function! VickerAddTime(in_place = 1)
        " Inserts cur time on cur line and next one, sets up next task
        if a:in_place
            " If on a closed fold, we only care about the last line of the fold
            let l:linenum = foldclosedend(".") > 0 ? foldclosedend(".") : line(".")
        else
            let l:search_res = searchpos('\v^\s *- (\d\d[: ]){3}#', 'n')
            if l:search_res[0]
                let l:linenum = l:search_res[0]
            else
                throw "No open time entry found"
            endif
        endif
        let l:base_line = getline(l:linenum)

        " Escape problematic chars
        let l:nextTask = input("Next tasks's name: ")
        let l:nextTask = escape(l:nextTask, "=!@#/%$&\\")
        let l:curTime = trim(system('date +%T'))
        if(l:nextTask == '')
            return 0
        endif

        let l:closed_line = substitute(l:base_line, '\v($| #)', ' '.l:curTime.'\1', '')
        let l:new_line = substitute(l:base_line, '\v( *-).*', '\1 '.l:curTime.' # '.l:nextTask, '')
        call setline(l:linenum, l:closed_line)
        call append(l:linenum, l:new_line)

        if a:in_place
            call cursor(l:linenum+1, col("."))
        endif
    endfunction

endfunction

