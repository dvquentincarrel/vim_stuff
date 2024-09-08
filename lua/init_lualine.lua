vim.cmd.packadd('lualine.nvim')

require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diagnostics'},
        lualine_c = {'%f %m%r', 'navic'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'searchcount', 'location'}
    },
    inactive_sections = {
        lualine_a = {'%f'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
