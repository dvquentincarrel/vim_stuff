let mapleader=" "

" Makes i_<C-U> undoable
inoremap <C-U> <C-G>u<C-U>
inoremap <C-z> <C-o>u
inoremap <C-s> <C-o>:w<CR>
inoremap <A-Up> <esc>m':m-2<CR>``a
inoremap <A-Down> <esc>m':m+1<CR>``a
inoremap <F5> <C-o>:Make<cr>
inoremap <C-d>d <C-o>:read !date -Idate<CR><backspace><C-o>$
inoremap <C-d>D <C-o>:read !date -Iseconds<CR><backspace><C-o>$
inoremap <C-d>t <C-o>:read !date +\%T<CR><backspace><C-o>$
inoremap <C-d>T <C-o>:read !date +\%T+\%Z<CR><backspace><C-o>$
inoremap jj <esc>
" V overwrites 'insert char below cursor'
inoremap <C-e> <C-o>$
" V overwrites 'insert again'
inoremap <C-a> <C-o>^

if has('clipboard')
	vnoremap <C-c> "+y
else
	vnoremap <C-c> y:call system("xclip -sel c",@0)<cr>
endif
vnoremap <tab> >gv
vnoremap <S-tab> <gv
vnoremap <C-d>c+ :!calc_duration -m sum<cr>
vnoremap <leader>col :!column -t<cr>

nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F5> <Esc>:Make<cr>
nnoremap [q :cp<Cr>
nnoremap ]q :cn<Cr>
nnoremap <A-Down> :m+1<cr>
nnoremap <A-Up> :m-2<CR>
nnoremap <bs> :set hls!<cr>
nnoremap <C-w>c :Cpfile<cr><cr>:redraw!<cr>:echo "Copied"<cr>
nnoremap <C-d>c :TDelta<cr>kJa= <esc>
nnoremap <C-d>c+ :TAdd<cr>kJa= <esc>
nnoremap <C-w>o :tabedit %<cr>
nnoremap <A-left> <c-w>5<
nnoremap <A-right> <c-w>5>
nnoremap <leader>k_ :call ToggleUndKword()<cr>
nnoremap <leader>k. :call ToggleDotKword()<cr>
nnoremap <leader>r :set rnu!<cr>
nnoremap <leader>t% :call TagJump()<cr>
nnoremap gf :e <cfile><CR>
nnoremap <leader>gf :tabe <cfile><CR>
nnoremap <expr> c v:register =~ '[\*+]' ? '""c' : 'c'
nnoremap <expr> C v:register =~ '[\*+]' ? '""C' : 'C'
nnoremap <expr> s v:register =~ '[\*+]' ? '""s' : 's'
nnoremap <expr> S v:register =~ '[\*+]' ? '""S' : 'S'
nnoremap <expr> x v:register =~ '[\*+]' ? '""x' : 'x'
nnoremap <expr> X v:register =~ '[\*+]' ? '""X' : 'X'

" nnoremap <Esc> <nop>
" nnoremap <left> <nop>
" nnoremap <up> <nop>
" nnoremap <right> <nop>
" nnoremap <down> <nop>

" For Uppercase
onoremap u :call search('\u')<cr>
" For Dot
onoremap D :call search('\.')<cr>
" For underScore
onoremap s :call search('_')<cr>
