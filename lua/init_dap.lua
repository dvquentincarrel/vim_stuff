dap = require("dap")
dapui = require("dapui")
dapui.setup()
dapui.setup({
    layouts= {
        {
            elements = {{
                id = "breakpoints",
                size = 0.10
            }, {
                id = "stacks",
                size = 0.90
            }},
            position = "left",
            size = 40
        },
        {
            elements = {{
                id = "watches",
                size = 0.50
            }, {
                id = "scopes",
                size = 0.50
            }},
            position = "right",
            size = 40
        },
        {
            elements = {{
                id = "repl",
                size = 1.0
            }},
            position = "bottom",
            size = 10
        }
    }
})

vim.keymap.set('n', '<F8>', function()
    vim.o.switchbuf = 'uselast'
    dap.continue() 
end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() dap.run_to_cursor() end)
vim.keymap.set('n', '<Leader>dp', function() dap.goto_() end)
vim.keymap.set('n', '<Leader>df', function() dap.focus_frame() end)
vim.keymap.set('n', '<Leader>dt', function() dapui.toggle() end)
vim.keymap.set('n', '<Leader>dT', function() dapui.toggle({layout=1}) end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)

ok, dappy = pcall(require, 'dap-python')
if ok then
    dappy.setup()
end
