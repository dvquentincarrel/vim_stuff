vim.cmd.packadd('gruvbox.nvim')
local gb = require('gruvbox')

gb.setup({italic = {comments = false}})
vim.cmd.colorscheme('gruvbox')
