vim.cmd.packadd('mini.surround')
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
