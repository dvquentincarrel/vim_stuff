vim.b.vicker_path = vim.fn.resolve(vim.fn.expand('<sfile>:p:h'))

function setup_vicker()
    -- The async stuff had to be isolated as much as possible as it
    -- Caused the operations to be split across multiple undos

    vim.b.open_entry_regex = [=[\v^\s*- ?\d\d:\d\d:\d\d( #|$)]=]
    vim.b.day_regex = [=[^\d\d\d\d-\d\d-\d\d *: *$]=]
    indentation = math.min(vim.bo.sw, vim.bo.ts)
    vim.b.categ_re_prefix = '^'..string.rep(' ', indentation * 1)
    vim.b.categ_re_suffix = ':$'
    vim.b.generic_categ_re = vim.b.categ_re_prefix..'.*'..vim.b.categ_re_suffix

    function choose_command()
        vim.ui.select({'Add entry', 'Add category', 'Add day', 'Close entry', 'Split entry'},
            {},
            function(name, id)
                if id == 1 then
                    add_entry()
                elseif id == 2 then
                    add_categ()
                elseif id == 3 then
                    add_day()
                elseif id == 4 then
                    close_entry()
                else
                    split_entry()
                end
            end
        )
    end

    -- Find the open line, closes it, return the line number
    function close_entry(time)
        time = time or os.date('%T')
        lnum, _ = unpack(vim.fn.searchpos(vim.b.open_entry_regex))
        if lnum == 0 then return end
        line_content = vim.api.nvim_get_current_line()
        closed_line = vim.fn.substitute(line_content, [[\d \zs#]], time..' #', '')
        vim.api.nvim_set_current_line(closed_line)
        return lnum
    end

    -- Closes the open entry, creates a new one underneath. Returns lnum above added line
    function add_entry(time, name)
        local time = time or os.date('%T')
        local function worker(name)
            if not name then return end
            if name == '' then name = '/' end
            lnum = close_entry(time)
            lnum = lnum or vim.fn.line('.')
            line = string.rep(' ', vim.bo.sw*2)..'- '..time..' # '..name
            vim.fn.append(lnum, line)
            return lnum
        end

        if not name then
            return vim.ui.input({prompt='Entry'}, worker)
        else
            return worker(name)
        end
    end

    -- Adds a new entry in a new category, or to an existing one
    function add_categ(time, categ, entry)
        local time = time or os.date('%T')

        local function worker(categ)
            -- If the category already exists, move the new entry under it
            if specific_lnum ~= 0 then
                local old_fe = vim.wo.foldenable
                vim.wo.foldenable = false
                vim.cmd((lnum+1)..'move '..(specific_lnum))
                vim.wo.foldenable = old_fe
            else
                if categ == '' then categ = 'misc' end
                line = string.rep(' ', vim.bo.sw)..categ..':'
                vim.fn.append(lnum, line)
            end
        end

        if not categ or not entry then
            vim.ui.input({prompt='Category'}, function(categ)
                -- Handle mid-creation cancelling
                if not categ then return end
                vim.ui.input({prompt='Entry'}, function(entry)
                    -- Handle mid-creation cancelling
                    if not entry then return end
                    lnum = add_entry(time, entry)
                    specific_lnum = find_existing_categ(categ)
                    worker(categ)
                end)
            end)
        -- When called through add_day
        else
            lnum = add_entry(time, entry)
            specific_lnum = 0
            worker(categ)
        end
    end

    -- Adds new day line, new categ, new entry
    function add_day(time)
        time = time or os.date('%T')
        date = os.date('%F')
        vim.ui.input({prompt='Category ('..date..')'}, function(categ)
            if not categ then return end
            vim.ui.input({prompt='Entry ('..date..')'}, function(entry)
                if not entry then return end
                close_entry(time) -- Just in cast
                vim.fn.append('$', date..':')
                vim.fn.cursor('$', 0)
                add_categ(time, categ, entry)
            end)
        end)
    end

    function anchor_to_sec(anchor)
        hour, min, sec = unpack(vim.fn.split(anchor, ':'))
        hour = tonumber(hour)
        min = tonumber(min)
        sec = tonumber(sec)
        return sec + 60*min + 3600*hour
    end

    function sec_to_anchor(sec)
        local hour = math.floor(sec / 3600)
        sec = sec - 3600*hour
        local min = math.floor(sec / 60)
        sec = sec - 60*min
        return string.format("%02d:%02d:%02d", hour, min, sec)
    end

    function split_entry(time)
        local start_lnum = vim.fn.line('.')
        local post_anchor = string.match(
            vim.fn.getline(start_lnum),
            [=[- (%d%d:%d%d:%d%d)]=]
        )
        if not post_anchor then
            error('No starting time found for line "' .. vim.fn.getline('.') .. '"')
        end

        -- Search matching line, starts from the current day
        vim.fn.cursor('$', 0)
        vim.fn.search(vim.b.day_regex, 'b')
        vim.fn.search('- \\d\\d:\\d\\d:\\d\\d ' .. post_anchor)
        local end_lnum = vim.fn.line('.')

        re = [=[- (%d%d:%d%d:%d%d) ]=] .. post_anchor
        local pre_anchor = string.match(
            vim.fn.getline(end_lnum),
            [=[- (%d%d:%d%d:%d%d) ]=] .. post_anchor
        )
        if not pre_anchor then
            error('No starting time found for ending time "' .. post_anchor .. '"')
        end

        pre_sec = anchor_to_sec(pre_anchor)
        post_sec = anchor_to_sec(post_anchor)
        vim.ui.input({prompt=string.format('Minutes before post anchor, between "%s" and "%s"', pre_anchor, post_anchor)}, function(entry)
            if not entry then return end
            -- TODO: parse time in pre_anchor and post_anchor, modify them, add new entry above line from which function was called
            entry_sec = tonumber(entry*60)
            spliced_sec = post_sec - entry_sec
            spliced_anchor = sec_to_anchor(spliced_sec)
            new_line = string.format('    - %s %s # /', spliced_anchor, post_anchor)
            -- Replaces old occurences
            vim.cmd.substitute({
                range={end_lnum},
                args={string.format('/%s/%s/', post_anchor, spliced_anchor)}
            })
            --vim.cmd.substitute({
            --    range={start_lnum},
            --    args={string.format('/%s/%s/', post_anchor, spliced_anchor)}
            --})
            vim.fn.append(start_lnum-1, new_line)
        end)
    end

    -- Return the line number of the last entry of the given category for the
    -- current day if it exists, 0 otherwise
    function find_existing_categ(categ_name)
        -- Sets cursor to current day
        vim.fn.cursor(unpack(vim.fn.searchpos(vim.b.day_regex, 'b')))

        specific_categ_re = vim.b.categ_re_prefix..categ_name..vim.b.categ_re_suffix
        spe_categ_lnum, _ = unpack(vim.fn.searchpos(specific_categ_re, 'W'))
        if spe_categ_lnum == 0 then
            return 0
        end
        vim.fn.cursor(spe_categ_lnum, _)

        gen_categ_lnum, _ = unpack(vim.fn.searchpos(vim.b.generic_categ_re, 'W'))
        if gen_categ_lnum == 0 then
            return vim.fn.line('$')
        end

        return gen_categ_lnum-1
    end

    vim.keymap.set('n', '<leader>c', choose_command, {buffer=0, desc="Choose vicker command"})
    vim.keymap.set('n', 't', add_entry, {buffer=0, desc="Punch new entry"})
    vim.keymap.set('n', 'T', add_categ, {buffer=0, desc="Punch new category"})
    vim.keymap.set('n', '<leader>d', add_day, {buffer=0, desc="Punch new day"})
    vim.keymap.set('n', '<leader>D', add_day, {buffer=0, desc="Punch new day"})
    vim.keymap.set('n', '<leader>s', split_entry, {buffer=0, desc="Split entry (WIP)"})
    vim.keymap.set('v', 't', ':!python '..vim.b.vicker_path..'/vicker.py<CR>', {buffer=0, silent=true, desc="Compute selected timespan"})
end

vim.api.nvim_create_augroup('Vicker', {})
vim.api.nvim_create_autocmd({'BufRead'}, {
    pattern = 'time.yaml',
    callback = setup_vicker,
})
