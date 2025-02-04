augroup auto_open_cw
    " Automatically opens/close quickfix list when populated/emptied
    autocmd!
    autocmd QuickFixCmdPost * if getqflist({'size':''})['size'] > 0 | copen | else | cclose | endif
augroup END

"augroup toggle_listchars
"    " If enabled, list chars are hidden during insert mode
"    autocmd!
"    autocmd InsertEnter * let listval = &list | let &list = 0
"    autocmd InsertLeave * let &list = listval
"augroup END

"augroup mem_folds
"	" Automatically saves and loads the view. Skips on long path names, to
"    " circumvent filesystem limitations
"	autocmd!
"    autocmd BufWrite * if len(expand('%:p')) < 100 | mkview | endif
"	autocmd BufRead * silent! loadview
"augroup END

if !has('nvim')
    augroup keep_clip
        " Keeps clipboard on vim exit
        autocmd VimLeave * call system("xclip -sel c", getreg('+'))
    augroup END
endif
