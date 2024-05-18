require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "bash", "vim", "json", "html",
                         "markdown", "markdown_inline", "make", "sql" },
    highlight = {
        enable = true ,
        disable = function(lang, buf)
            return vim.api.nvim_buf_line_count(buf) >= 15000
        end

    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
