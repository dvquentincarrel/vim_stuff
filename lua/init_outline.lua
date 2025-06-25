vim.cmd.packadd('outline.nvim')
require("outline").setup({
    outline_window = {
        position = 'right',
        width = 25,
    },
    symbols = {
        icon_fetcher = function(kind, bufnr, symbol)
            tbl = {
                Function = '󰊕',
                Variable = '󰀫',
                Constant = '󰏿',
            }
            if tbl[kind] then
                return tbl[kind]
            else
                return false
            end
        end
    }
})

vim.keymap.set(
    'n',
    '<F4>',
    ':Outline<cr>'
)
