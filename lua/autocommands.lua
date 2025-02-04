vim.api.nvim_create_autocmd({'TermOpen'}, {
    pattern = {'*'},
    command = 'startinsert',
    desc = 'Automatically drops into insert mode when opening a terminal window'
})
