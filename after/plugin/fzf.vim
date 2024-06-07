if exists(':Files')
    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fg :call fzf#vim#gitfiles(getcwd())<CR>
    nnoremap <leader>fG :GFiles<CR>
    nnoremap <leader>fb :Buffers<CR>
    nnoremap <leader>fr :Rg! 
    nnoremap <leader>fR :RG!<CR>
    nnoremap <leader>fl :BLines<CR>
    nnoremap <leader>fL :Lines<CR>
    nnoremap <leader>ft :BTags<CR>
    nnoremap <leader>fT :Tags<CR>
    nnoremap <leader>fm :Marks<CR>
    nnoremap <leader>fc :BCommits<CR>
    nnoremap <leader>fC :Commits<CR>
    nnoremap <leader>fh :Helptags<CR>
    nnoremap <leader>fp :History<CR>
endif

if exists(':FzfLua')
    FzfLua setup_fzfvim_cmds
    nnoremap <leader>fg :lua require('fzf-lua').git_files({cwd=vim.loop.cwd()})<CR>
    nnoremap <leader>fd :FzfLua dap_commands<CR>
endif
