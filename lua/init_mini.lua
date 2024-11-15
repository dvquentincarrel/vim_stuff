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
        }
    }
})
require('mini.indentscope').setup{
    draw={
        animation=require('mini.indentscope').gen_animation.quadratic{
            easing='in-out',
            duration=40,
        }
    }
}
