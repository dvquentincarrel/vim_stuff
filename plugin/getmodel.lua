opp_setup_win = function(width_percent, height_percent)
    -- Sets up window
    local newbuf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.o.columns * (width_percent / 100) + 0.5)
    local height = math.floor(vim.o.lines * (height_percent / 100) + 0.5)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)
    local new_win = vim.api.nvim_open_win(newbuf, true, {relative='editor', row=row, col=col, width=width, height=height, border='rounded', style='minimal'})
    return new_win
end

get_model = function(width_percent, height_percent)
    -- Sets up window
    opp_setup_win(width_percent, height_percent)

    -- Callback when the script is done running
    on_exit = function(job_id, exit_code, type)
        vim.api.nvim_win_close(0, false)
        if exit_code == 0 then
            vim.cmd.cgetfile('/tmp/files.omod')
            vim.cmd.cwindow()
        end
    end

    -- Start script
    vim.fn.termopen('getmodel -n', {on_exit=on_exit})
end

vim.keymap.set("n", "<leader>gm", function() get_model(80, 80) end)

open_modules = function(width_percent, height_percent)
    -- Sets up window
    opp_setup_win(width_percent, height_percent)

    -- on_stdout caught stderr as well
    on_exit = function(job_id, exit_code, type)
        vim.api.nvim_win_close(0, false)
        dir = vim.fn.readfile('/tmp/nv_fzo')
        vim.cmd.cd(dir)
    end

    -- Start script
    vim.fn.termopen('_fzo -a > /tmp/nv_fzo', {on_exit=on_exit, on_data=on_stdout})
end
vim.keymap.set("n", "<leader>go", function() open_modules(80, 80) end)
