local lsp_packs = {
    'lsp-zero.nvim',
    'cmp-buffer',
    'cmp-nvim-lsp',
    'cmp-nvim-lsp-signature-help',
    'nvim-cmp',
    'nvim-lspconfig',
    'mason-lspconfig.nvim',
    'mason.nvim',
    'nvim-navic',
}
for _, pack_name in ipairs(lsp_packs) do
    vim.cmd.packadd(pack_name)
end


local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig(
    {
        capabilities = {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true
                }
            }
        }
    }
)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
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

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Get information about the hovered symbol" }) -- Same as nvim-lspconfig
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Get signature help"}) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Goto type defintion"})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto definition"}) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Goto implementation"}) -- Same as nvim-lspconfig
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Find references"}) -- Same as nvim-lspconfig
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename symbol"})

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add workspace folder"})
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "Remove workspace folder"})
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = "List workspace folders"})

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Find references"}) -- Same as nvim-lspconfig
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Use code-action"}) -- Same as nvim-lspconfig
    vim.keymap.set('n', '<space>glf', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = "Format file"})
  end,
})
