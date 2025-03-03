vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.api.nvim_create_user_command('DiagQuickfix', vim.diagnostic.setqflist, {})
vim.api.nvim_create_user_command('DiagInspect', vim.diagnostic.open_float, {})
vim.api.nvim_create_user_command(
    'DiagToggle',
    function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end,
    {}
)

