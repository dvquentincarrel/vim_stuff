"command Make silent make % | redraw! | cw | wincmd k 
command -bar Make silent make | redraw! | cw | wincmd k 
command Reload source ~/.vim/vimrc 
command -nargs=? Lorem read !lorem <args> 
command W w
command Splitattrs s/<\w* /&\r/ | s/" /"\r/g | s/\/\?>/\r&/
command -bar Inject w | !dataer inject
command -range Dictify :'<,'>norm I'ea'yi'$a : ,hp
command -nargs=1 -bar Read redir @" | silent <args> | redir END
command -nargs=1 -complete=command Tread Read <args> | tabe tread | setl buftype=nofile | setl bufhidden=delete | put \"
" Diffs current buffer with its on-disk version for the times you've messed up (yes, this is :DiffOrig)
command DiffDisk diffthis | vnew | read ++edit # | setl buftype=nofile | 0d_ | diffthis
command Fcl redir @+ | echon expand('%:p') | redir END
