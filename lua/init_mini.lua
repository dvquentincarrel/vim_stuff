vim.cmd.packadd('mini.surround')
vim.cmd.packadd('mini.indentscope')
require('mini.surround').setup({
    custom_surroundings = {
        ['d'] = { -- Python dict, balanced square brackets
            input = {
                '%f[%w][%w]+%b[]', [=[^.-%[['"]().*()['"].$]=]
            },
            output = function()
                local dict_name = MiniSurround.user_input('Dictionary name')
                if dict_name then
                    return { left = dict_name .. "[", right = "]"}
                end
            end,
        },
        ['p'] = { -- Lisp procedure, balanced parens
            input = {
                '%b()' ,'^.[%S]+[%s]+().*().'
            },
            output = function()
                local procedure_name = MiniSurround.user_input('Procedure name')
                if procedure_name then
                    return { left = "(" .. procedure_name .. " ", right = ")" }
                end
            end,
        },
        ['a'] = { -- Ansi csi wrapping
            input = {
                '\\x1b.-m().*()\\x1b.-m'
            },
            output = function()
                local ansi_csi_code = MiniSurround.user_input('ANSI CSI code')
                if ansi_csi_code then
                    return { left = '\\x1b[' .. ansi_csi_code .. "m", right = "\\x1b[m"}
                end
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
