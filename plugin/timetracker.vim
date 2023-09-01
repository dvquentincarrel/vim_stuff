" Mappings {{{
inoremap <C-d>d <C-o>:read !date -Idate<CR><backspace><C-o>$
inoremap <C-d>D <C-o>:read !date -Iseconds<CR><backspace><C-o>$
inoremap <C-d>t <C-o>:read !date +\%T<CR><backspace><C-o>$
inoremap <C-d>T <C-o>:read !date +\%T+\%Z<CR><backspace><C-o>$

nnoremap <Leader>c :TDelta<cr>kJa= <esc>

vnoremap <silent> <Leader>c :!calc_duration -m sum<cr>

" }}}
" Commands {{{
command TDelta exec "read !calc_duration ". getline(".")
" }}}
" vim: foldmethod=marker
