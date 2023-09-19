augroup vicker
    autocmd!
    autocmd BufRead time.yaml let b:vickerPath = resolve(expand('<sfile>:p:h')) | call SetupVicker()
augroup END

function! SetupVicker()
    nnoremap <buffer> <leader>t :call VickerAddTime()<cr>
    exec "vnoremap <buffer><silent> <leader>t :!python ".b:vickerPath."/vicker.py<cr>"
    function! VickerAddTime()
        " Inserts cur time on cur line and next one, sets up next task
        let b:nextTask = input("Next tasks's name: ")
        let b:curTime = trim(system('date +%T'))
        exec ".!perl -pe 's/($| \\#)/ ".b:curTime."$1/'"
        . yank | put
        exec ".!perl -pe 's/( *-).*/$1 ".b:curTime." \\# ".escape(b:nextTask, "'\ ")."/'"
    endfunction
endfunction

