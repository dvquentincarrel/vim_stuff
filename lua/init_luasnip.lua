local ls = require("luasnip")

vim.keymap.set(
    {"i", "s"}, "<C-K>",
    function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end end,
    {silent = true, desc = "Expand a snippet, or goto next var of snippet"})

vim.keymap.set(
    {"i", "s"},
    "<C-J>",
    function() ls.jump(-1) end,
    {silent = true, desc = "Goto prev var of snippet"})

vim.keymap.set(
    {"i", "s"},
    "<C-C>",
    function()
    if ls.choice_active() then
        require("luasnip.extras.select_choice")()
    end end,
    {silent = true, desc = "Cycle through options for snippet var"})

function reload_snippets(t)
    if t[1] == nil or t[1] == '' then
        paths = vim.env.GIT_PATH..'/snippets'
    else
        paths = t[1]
    end
    require("luasnip.loaders.from_snipmate").load({paths=paths})
end

reload_snippets{}
vim.api.nvim_create_user_command('LuaSnipReloadSnippets', function(t) reload_snippets{t.args} end, {})
