vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd('source ~/.vim/vimrc')

local TSgroup = vim.api.nvim_create_augroup('vimrc', {clear = true})
vim.api.nvim_create_autocmd({'Filetype'}, {
    pattern = '*.py,*.sh,*.vim,*.json',
    group = TSgroup,
    command = 'lua vim.treesitter.start()'
})
