get_model = function(width_percent, height_percent)
    -- Sets up window
    local newbuf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.api.nvim_win_get_width(0) * (width_percent / 100) + 0.5)
    local height = math.floor(vim.api.nvim_win_get_height(0) * (height_percent / 100) + 0.5)
    local col = math.floor((vim.api.nvim_win_get_width(0) - width) / 2)
    local row = math.floor((vim.api.nvim_win_get_height(0) - height) / 2)
    local new_win = vim.api.nvim_open_win(newbuf, true, {relative='editor', row=row, col=col, width=width, height=height, border='rounded', style='minimal'})

    -- Callback when the script is done running
    on_exit = function()
        vim.api.nvim_win_close(0, false)
        vim.cmd.tabe('/tmp/files.omod')
    end

    -- Start script
    vim.fn.termopen('getmodel -n', {on_exit=on_exit})
end

vim.keymap.set("n", "<leader>gm", function() get_model(80, 80) end)
