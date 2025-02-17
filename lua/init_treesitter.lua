local treesitter_packs = {
    'nvim-treesitter',
    'nvim-treesitter-refactor',
    'nvim-treesitter-textobjects',
}
for _, pack_name in ipairs(treesitter_packs) do
    vim.cmd.packadd(pack_name)
end

function disable_cond(lang, buf) -- Disable treesitter for files larger than 15k lines
    return vim.api.nvim_buf_line_count(buf) >= 15000
end

require 'nvim-treesitter.configs'.setup {
    incremental_selection = {
        enable = true,
        disable = disable_cond,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            node_decremental = "grm",
            scope_incremental = false,
        },
    },
    indent = { enable = true, disable = disable_cond },
    highlight = { enable = true, disable = disable_cond },
    refactor = {
        highlight_definitions = {
            --enable = true,
            disable = disable_cond,
            clear_on_cursor_move = true,
        },
    },
    textobjects = {
        select = {
            enable = true,
            disable = disable_cond,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Select outer function"},
                ["if"] = { query = "@function.inner", desc = "Select inner function"},
                ["ac"] = { query = "@class.outer", desc = "Select outer class"},
                ["ic"] = { query = "@class.inner", desc = "Select inner class" },
            },
            selection_modes = {
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = 'V', -- blockwise
            },
        },
    },
}

vim.api.nvim_create_autocmd('BufEnter', {
    desc="Use treesitter folding if a parser is known for the language",
    group="NvimTreesitter",
    pattern={"*"},
    callback = function(event)
        ok, msg = pcall(vim.treesitter.get_parser)
        if ok then
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo.foldmethod = 'expr'
        end
    end,
})
