local init_real_path = vim.loop.fs_readlink(vim.env.HOME..'/.config/nvim/init.lua')
local git_path = string.gsub(init_real_path, '/init.lua', '')
vim.env.GIT_PATH = git_path
vim.opt.runtimepath:append(git_path)
vim.opt.runtimepath:append(git_path..'/after')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd('source '..git_path..'/vimrc')

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "bash", "vim", "json", "html",
                         "markdown", "markdown_inline", "make" },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
vim.treesitter.language.register("html", "xml")

local TSgroup = vim.api.nvim_create_augroup('vimrc', {clear = true})
vim.api.nvim_create_autocmd({'Filetype'}, {
    pattern = 'python,sh,bash,vim,json,html,markdown',
    group = TSgroup,
    command = 'lua vim.treesitter.start()'
})

local HLYank = vim.api.nvim_create_autocmd({'TextYankPost'}, {
    pattern = '*',
    command = 'lua vim.highlight.on_yank({on_visual=false, timeout=750})'
})

