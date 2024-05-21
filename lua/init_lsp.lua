local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver',},
  handlers = {
    lsp_zero.default_setup,
  }
})

vim.api.nvim_create_user_command('StopLsp', function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover) -- Same as nvim-lspconfig
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Same as nvim-lspconfig
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Same as nvim-lspconfig
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- Same as nvim-lspconfig
    vim.keymap.set('n', '<space>glf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
