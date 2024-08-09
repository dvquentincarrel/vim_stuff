local ok, fzflua = pcall(require, 'fzf-lua')
if ok then
    fzflua.setup{
        winopts = {
            backdrop = 90
        }
    }
    fzflua.config.defaults.keymap.builtin["<C-p>"] = "toggle-preview"
    fzflua.config.defaults.keymap.builtin["<M-f>"] = "toggle-fullscreen"
    fzflua.config.defaults.winopts.preview.layout = "vertical"
    fzflua.config.defaults.winopts.preview.vertical = "down:80%"

    vim.keymap.set(
        {"n"},
        "<leader>fz",
        ":FzfLua<cr>",
        {silent = true, desc = "Opens FzfLua"})
end
