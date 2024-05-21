local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'buffer',
        option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        }
    },
}
})
