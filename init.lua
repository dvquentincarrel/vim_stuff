vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd('source ~/.vim/vimrc')

local TSgroup = vim.api.nvim_create_augroup('vimrc', {clear = true})
vim.api.nvim_create_autocmd({'Filetype'}, {
    pattern = 'python,sh,bash,vim,json,html',
    group = TSgroup,
    command = 'lua vim.treesitter.start()'
})

local HLYank = vim.api.nvim_create_autocmd({'TextYankPost'}, {
    pattern = '*',
    command = 'lua vim.highlight.on_yank({on_visual=false, timeout=750})'
})
