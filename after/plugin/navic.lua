ok, navic = pcall(require, 'nvim-navic')
if ok then
    navic.setup{
        lsp = { auto_attach = true },
        highlight = true,
        safe_output = true,
    }
end
