let pack_names = [
    \ 'fzf.vim', 'NrrwRgn', 'nerdtree', 'vim-signify',
    \ 'tagbar', 'vim-dadbod-ui', 'vim-dadbod', 'vim-fugitive',
    \ 'undotree', 'vim-xml-runtime'
    \]
if ! exists("g:neovide")
    let pack_names=add(pack_names, 'vim-smoothie')
endif

for pack_name in pack_names
    exec 'packadd '..pack_name
endfor
