for pack_name in [
        \ 'fzf.vim', 'NrrwRgn', 'nerdtree', 'vim-signify', 'vim-smoothie',
        \ 'tagbar', 'vim-dadbod-ui', 'vim-dadbod', 'vim-fugitive',
        \ 'undotree', 'vim-xml-runtime'
        \]
    exec 'packadd '..pack_name
endfor
