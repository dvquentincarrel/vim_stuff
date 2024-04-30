local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver',},
  handlers = {
    lsp_zero.default_setup,
  }
})

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

vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gli", vim.lsp.buf.implementation)
vim.keymap.set("n", "glr", vim.lsp.buf.references)
vim.keymap.set("n", "glR", vim.lsp.buf.rename)
