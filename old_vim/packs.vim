set runtimepath+=$GIT_PATH
set runtimepath+=$GIT_PATH/after
let &packpath = &runtimepath

try
    packadd gruvbox
    packadd indentLine
catch | endtry
