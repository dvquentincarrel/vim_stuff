local dap_packs = {
    'nvim-dap',
    'nvim-dap-ui',
    'nvim-dap-virtual-text',
    'nvim-nio',
    'nvim-dap-python',
}
for _, pack_name in ipairs(dap_packs) do
    vim.cmd.packadd(pack_name)
end

dap = require("dap")
dapui = require("dapui")
dapui.setup()
dapui.setup({
    layouts= {
        {
            elements = {{
                id = "breakpoints",
                size = 0.10
            },
                {
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
vim.keymap.set(
    'n',
    '<F10>',
    function() dap.step_over() end,
    {desc = "DAP step over"}
)
vim.keymap.set('n',
    '<F11>',
    function() dap.step_into() end,
    {desc = "DAP step into"}
)
vim.keymap.set('n',
    '<F12>',
    function() dap.step_out() end,
    {desc = "DAP step out"}
)
vim.keymap.set('n',
    '<Leader>db',
    function() dap.toggle_breakpoint() end,
    {desc = "DAP step toggle breakpoints"}
)
vim.keymap.set('n',
    '<Leader>dr',
    function() dap.run_to_cursor() end,
    {desc = "DAP run to cursor"}
)
vim.keymap.set('n',
    '<Leader>dp',
    function() dap.goto_() end,
    {desc = "DAP goto cursor"}
)
vim.keymap.set('n',
    '<Leader>df',
    function() dap.focus_frame() end,
    {desc = "DAP focus frame (cursor position)"}
)
vim.keymap.set('n',
    '<Leader>dt',
    function() dapui.toggle() end,
    {desc = "DAP Toggle UI"}
)
vim.keymap.set('n',
    '<Leader>dT',
    function() dapui.toggle({layout=1}) end,
    {desc = "DAP Toggle UI left panes"}
)
vim.keymap.set({'n',
    'v'},
    '<Leader>dh',
    function() require('dap.ui.widgets').hover() end,
    {desc = "DAP evaluate hovered/selected expression"}
)

local ok
ok, dappy = pcall(require, 'dap-python')
if ok then
    dappy.setup()
end
