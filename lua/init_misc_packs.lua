local mis_packs = {
    'gruvbox.nvim',
    'nvim-web-devicons',
    'dressing.nvim',
    'indent-blankline.nvim',
}
for _, pack_name in ipairs(mis_packs) do
    vim.cmd.packadd(pack_name)
end
