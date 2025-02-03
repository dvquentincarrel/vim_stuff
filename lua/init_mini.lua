vim.cmd.packadd('mini.surround')
vim.cmd.packadd('mini.indentscope')
require('mini.surround').setup({
    custom_surroundings = {
        ['d'] = {
            input = {
                [=[%f[%w_][%w_]+%[['"]()[%S]+()['"]%]]=]
            },
            output = function()
                local dict_name = MiniSurround.user_input('Dictionary name')
                return { left = dict_name .. "['", right = "']"}
            end,
        },
        ['a'] = { -- Ansi csi wrapping
            output = function()
                local ansi_csi_code = MiniSurround.user_input('ANSI CSI code')
                return { left = '\\x1b[' .. ansi_csi_code .. "m", right = "\\x1b[m"}
            end,
        }
    }
})
require('mini.indentscope').setup{
    draw={
        animation=require('mini.indentscope').gen_animation.exponential{
            easing='out',
            duration=40,
        }
    }
}
