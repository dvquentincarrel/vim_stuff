augroup auto_open_cw
    " Automatically opens/close quickfix list when populated/emptied
    autocmd!
    autocmd QuickFixCmdPost * if getqflist({'size':''})['size'] > 0 | copen | else | cclose | endif
augroup END

augroup toggle_listchars
    " If enabled, list chars are hidden during insert mode
    autocmd!
    autocmd InsertEnter * let listval = &list | let &list = 0
    autocmd InsertLeave * let &list = listval
augroup END

augroup mem_folds
	" Automatically saves and loads the view. Skips on long path names, to
    " circumvent filesystem limitations
	autocmd!
    autocmd BufWrite * if len(expand('%:p')) < 100 | mkview | endif
	autocmd BufRead * silent! loadview
augroup END

augroup no_chevron
    " Fixes the times you fat-finger your way into ':w<'
    autocmd!
    autocmd BufWritePost < w | silent !rm '<' 
augroup END

if !has('nvim')
    augroup keep_clip
        " Keeps clipboard on vim exit
        autocmd VimLeave * call system("xclip -sel c", getreg('+'))
    augroup END
endif

if has('nvim')
    augroup term_insert
        autocmd!
        autocmd TermOpen * startinsert
    augroup END

    augroup term_clo
        autocmd!
        autocmd TermClose *:fzf 
        \ if v:event.status == 0 
            \ | stopinsert 
            \ | call feedkeys('gg^"9y$a')
            \ | if g:fuzzy_split == 'tab' 
                \ | call feedkeys(':exec "tabedit ". @9')
            \ | else
                \ | call feedkeys(':exec "vs ". @9')
            \ | endif
        \ | else
            \ | call feedkeys('')
        \ | endif
    augroup END
endif
