if ! has('nvim')
    let init_real_path = resolve($HOME.'/.vim/vimrc')
    let $GIT_PATH = substitute(init_real_path, '/vimrc', '', '')
    source $GIT_PATH/old_vim/packs.vim
    for script in split(expand($GIT_PATH.."/old_vim/*.vim"))
        if script != $GIT_PATH..'/old_vim/packs.vim'
            exec "source "..script
        endif
    endfor
endif

source $GIT_PATH/options.vim
source $GIT_PATH/mappings.vim
source $GIT_PATH/abbrevs.vim
source $GIT_PATH/autocommands.vim
source $GIT_PATH/functions.vim
source $GIT_PATH/commands.vim
source $GIT_PATH/packs.vim

filetype plugin indent on

try
    colorscheme gruvbox 
    let g:gruvbox_guisp_fallback = "bg"
catch
    try
        colorschem sorbet
    catch
        try
            colorschem habamax
        catch
            colorschem default
        endtry
    endtry
endtry

" Allows background to be transparent
hi Normal ctermbg=None
