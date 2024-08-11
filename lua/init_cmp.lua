local cmp = require('cmp')

cmp.setup({
    experimental = { ghost_text = true },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = {
            max_width = 200,
            max_height = 200,
            border = 'rounded',
        }},
    sources = {
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer',
          option = {
              get_bufnrs = function()
                  return vim.api.nvim_list_bufs()
              end
          }
      },
    },
    mapping = cmp.mapping.preset.insert{
        ['<C-u>'] = cmp.mapping(function(fallback)
            if cmp.visible_docs() then cmp.scroll_docs(-4) else fallback() end
        end, {'i', 'c'}),
        ['<C-d>'] = cmp.mapping(function(fallback)
            if cmp.visible_docs() then cmp.scroll_docs(4) else fallback() end
        end, {'i', 'c'}),
    },
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
