"command Make silent make % | redraw! | cw | wincmd k 
command -bar Make silent make | redraw! | cw | wincmd k 
command Reload source ~/.vim/vimrc 
command ExecCurLine exec getline(".")
command Vimrc tabnew ~/.vim/vimrc 
command -nargs=? Lorem read !lorem <args> 
command WW w !sudo tee %
command W w
command Splitattrs s/<\w* /&\r/ | s/" /"\r/g | s/\/\?>/\r&/
command Numcount echo system('sed "' . line(".") . 'q;d" ' . expand('%') . ' | wc -w | tr -d "\n"')
command -bar Inject w | !dataer inject
command MI Make | silent Inject | redraw!
command -range Dictify :'<,'>norm I'ea'yi'$a : ,hp
command Lint call Lint()
command Scrub call prop_clear(1, getbufinfo(bufnr(""))[0]['linecount']) " Removes all virtual text from current buffer
command -nargs=? -bar Tabs set tabstop=<args> | set shiftwidth=<args>
command -nargs=1 -bar Read redir @" | silent <args> | redir END
command -nargs=1 -complete=command Tread Read <args> | tabe tread | setl buftype=nofile | setl bufhidden=delete | put \"
" Diffs current buffer with its on-disk version for the times you've messed up (yes, this is :DiffOrig)
command DiffDisk diffthis | vnew | read ++edit # | setl buftype=nofile | 0d_ | diffthis
command Fcl redir @+ | echon expand('%:p') | redir END
command Pcl redir @+ | echon expand('%:p:h') | redir END
command Header setlocal sbo=hor | setlocal scrollbind | above 1sp+1
