local init_real_path = vim.loop.fs_readlink(vim.env.HOME..'/.config/nvim/init.lua')
local git_path = string.gsub(init_real_path, '/init.lua', '')
vim.env.GIT_PATH = git_path
vim.opt.runtimepath:append(git_path)
vim.opt.runtimepath:append(git_path..'/after')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd('source '..git_path..'/vimrc')

require('init_treesitter')
require('init_cmp')
require('init_lsp')
require('init_dap')

local HLYank = vim.api.nvim_create_autocmd({'TextYankPost'}, {
    pattern = '*',
    command = 'lua vim.highlight.on_yank({on_visual=false, timeout=750})'
})
