local init_real_path = vim.loop.fs_readlink(vim.env.HOME..'/.config/nvim/init.lua')
local git_path = string.gsub(init_real_path, '/init.lua', '')
vim.env.GIT_PATH = git_path
vim.opt.runtimepath:append(git_path)
vim.opt.runtimepath:append(git_path..'/after')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.g.editorconfig = false

vim.g.mapleader = ' '

require ('autocommands')
local init_files
if vim.g.vscode then
    init_files = {
        'init_misc_packs',
        'init_mini',
    }
else
    init_files = {
        'init_misc_packs',
        'init_fzflua',
        'init_treesitter',
        'init_cmp',
        'init_lsp',
        'init_dap',
        'init_luasnip',
        'init_lualine',
        'init_mini',
    }
    if vim.g.neovide then
        table.insert(init_files, 'init_neovide')
    end
end

for _, file_name in ipairs(init_files) do
    require(file_name)
end

vim.cmd('source '..git_path..'/vimrc')

local HLYank = vim.api.nvim_create_autocmd({'TextYankPost'}, {
    pattern = '*',
    command = 'lua vim.highlight.on_yank({on_visual=false, timeout=750})'
})

vim.cmd('hi Normal guibg=None')
