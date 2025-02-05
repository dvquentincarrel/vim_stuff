"command Make silent make % | redraw! | cw | wincmd k 
command -bar Make silent make | redraw! | cw | wincmd k 
command Reload source ~/.vim/vimrc 
command W w
command -nargs=1 -bar Read redir @" | silent <args> | redir END
" Diffs current buffer with its on-disk version for the times you've messed up (yes, this is :DiffOrig)
command DiffDisk diffthis | vnew | read ++edit # | setl buftype=nofile | 0d_ | diffthis | exec "norm <C-W>W"
command Fcl redir @+ | echon expand('%:p') | redir END
