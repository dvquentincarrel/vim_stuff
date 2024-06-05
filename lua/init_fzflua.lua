local ok, fzflua = pcall(require, 'fzf-lua')
if ok then
    fzflua.setup {}
    fzflua.config.defaults.keymap.builtin["<C-p>"] = "toggle-preview"
    fzflua.config.defaults.keymap.builtin["<M-f>"] = "toggle-fullscreen"
end
