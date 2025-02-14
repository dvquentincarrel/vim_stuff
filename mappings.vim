let mapleader=" "

inoremap <C-U> <C-G>u<C-U>
inoremap <Enter> <C-G>u<Enter>
inoremap <C-R> <C-G>u<C-R>
inoremap jj <esc>
inoremap jk <esc>
inoremap <expr> <C-d>d systemlist('date +%F')[0]
inoremap <expr> <C-d>D systemlist('date -Iseconds')[0]
inoremap <expr> <C-d>t systemlist('date +%T')[0]
inoremap <expr> <C-d>T systemlist('date +%T+%Z')[0]
" overwrites 'insert char below cursor'
noremap! <C-e> <End>
" overwrites 'insert again'
noremap! <C-a> <Home>

if has('clipboard')
	vnoremap <C-c> "+y
else
	vnoremap <C-c> y:call system("xclip -sel c",@0)<cr>
endif
vnoremap <tab> >gv
vnoremap <S-tab> <gv
"xnoremap s <cmd>call VisSurround("inline")<cr>
"xnoremap S <cmd>call VisSurround("around")<cr>
vnoremap < <gv
vnoremap > >gv

nnoremap gh ^
nnoremap gl $
nnoremap ]b <cmd>bnext<cr>
nnoremap [b <cmd>bprevious<cr>
nnoremap ]t <cmd>1tag<CR>
nnoremap [t <cmd>1pop<CR>
nnoremap g<C-]> :tj <C-r><C-w><CR>
nnoremap <F14> <cmd>execute b:formatter<CR>
nnoremap <F5> <cmd>Make<cr>
nnoremap <F17> <cmd>execute b:altmakeprg<cr>
nnoremap [q <cmd>cp<Cr>
nnoremap ]q <cmd>cn<Cr>
nnoremap [C <cmd>call search('\v^[<>=]{7} ?', 'b')<CR>
nnoremap ]C <cmd>call search('\v^[<>=]{7} ?')<CR>
nnoremap <C-Down> <c-w>2-
nnoremap <C-Up> <c-w>2+
nnoremap <C-left> <c-w>4<
nnoremap <C-right> <c-w>4>
nnoremap <bs> <cmd>set hls!<cr>
nnoremap <leader><bs> <cmd>DiagToggle<cr>
nnoremap <C-w>o <cmd>tabedit %<cr>
nnoremap <leader>r <cmd>set rnu!<cr>
nnoremap gf <cmd>e <cfile><CR>
nnoremap <c-w>gf <cmd>tabe <cfile><CR>
nmap <leader>gf <C-w>gf
nmap <leader>gF <C-w>gF
nnoremap <leader>/ <cmd>let @/='\<'..expand('<cword>')..'\>'<CR><cmd>call histadd('search', @/)<CR><cmd>set hls<CR>
nnoremap <leader>? <cmd>let @/=expand('<cWORD>')<CR><cmd>call histadd('search', @/)<CR><cmd>set hls<CR>
nnoremap <expr> <leader>C system(['code', '--goto', expand('%:p')..':'..getcurpos()[1]..':'..getcurpos()[2]])
nnoremap <expr> c v:register =~ '[\*+]' ? '""c' : 'c'
nnoremap <expr> C v:register =~ '[\*+]' ? '""C' : 'C'
nnoremap <expr> s v:register =~ '[\*+]' ? '""s' : 's'
nnoremap <expr> S v:register =~ '[\*+]' ? '""S' : 'S'
nnoremap <expr> x v:register =~ '[\*+]' ? '""x' : 'x'
nnoremap <expr> X v:register =~ '[\*+]' ? '""X' : 'X'

" Overwritten if ":Files" exists
nnoremap <leader>ff :let g:fuzzy_split='tab' <bar> :tabe <bar> :term fzf<CR>
nnoremap <leader>vff :let g:fuzzy_split='vert' <bar> :vs <bar> :term fzf<CR>
nnoremap <leader>fl :let fuzzy_line = input('Fuzzy pattern: ') <bar> :exec 'vim /'.fuzzy_line.'/f %' <bar> :copen <cr>

" For Uppercase
onoremap u <cmd>call search('\u')<cr>
" For Dot
onoremap D <cmd>call search('\.')<cr>
" For underScore
onoremap s <cmd>call search('_')<cr>

tnoremap <Esc> <C-\><C-N>
