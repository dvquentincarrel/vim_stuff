local mis_packs = {
    'nvim-web-devicons',
    'dressing.nvim',
    'diffview.nvim',
}
for _, pack_name in ipairs(mis_packs) do
    vim.cmd.packadd(pack_name)
end
