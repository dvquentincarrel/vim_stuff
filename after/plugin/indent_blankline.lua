ok, ibl = pcall(require, 'ibl')
if ok then
    ibl.setup({
        scope = {
            highlight = "@symbol",
            show_start = false,
            show_end = false,
            include = {
                node_type = {
                    ["*"] = { "if_statement", "for_statement", "assignment", "argument_list" }
                }
            },
        }
    })
end
