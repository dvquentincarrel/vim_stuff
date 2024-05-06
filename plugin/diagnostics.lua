vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.api.nvim_create_user_command('DiagQuickfix', vim.diagnostic.setqflist, {})
vim.api.nvim_create_user_command('DiagInspect', vim.diagnostic.open_float, {})
vim.api.nvim_create_user_command(
    'DiagToggle',
    function()
        if vim.diagnostic.is_disabled() then
            vim.diagnostic.enable()
        else
            vim.diagnostic.disable()
        end
    end, 
    {}
)

