local ls = require("luasnip")

vim.keymap.set({"i", "s"}, "<C-K>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-J>", function()
    ls.jump(-1)
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-C>", function()
	if ls.choice_active() then
        require("luasnip.extras.select_choice")()
	end
end, {silent = true})

require("luasnip.loaders.from_snipmate").load({paths=vim.env.GIT_PATH..'/snippets'})
