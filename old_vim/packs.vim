set runtimepath+=$GIT_PATH
set runtimepath+=$GIT_PATH/after
let &packpath = &runtimepath

for pack in ['gruvbox', 'vim-airline', 'indentLine']
    try
        exec 'packadd '..pack
    catch | endtry
endfor
