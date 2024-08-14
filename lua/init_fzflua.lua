local ok, fzflua = pcall(require, 'fzf-lua')
if ok then
    fzflua.setup{
        winopts = {
            backdrop = 90,
            preview = {
                layout = "vertical",
                vertical = "down:80%",
            },
        },
        grep = {
            no_esc = true,
        },
        keymap = {
            builtin = {
                ["<C-p>"] = "toggle-preview",
                ["<M-f>"] = "toggle-fullscreen",
            }
        }
    }

    vim.keymap.set(
        {"n"},
        "<leader>fz",
        ":FzfLua<cr>",
        {silent = true, desc = "Opens FzfLua"})
end
