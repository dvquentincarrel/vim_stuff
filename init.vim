set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

augroup TreeSitter
    autocmd!
    autocmd FileType *.py,*.sh,*.vim,*.json lua vim.treesitter.start()
augroup END

