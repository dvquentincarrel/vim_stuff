let mapleader=" "

inoremap <C-U> <C-G>u<C-U>
inoremap <Enter> <C-G>u<Enter>
inoremap <C-R> <C-G>u<C-R>
inoremap <A-Up> <esc>m':m-2<CR>``a
inoremap <A-Down> <esc>m':m+1<CR>``a
inoremap jj <esc>
" overwrites 'insert char below cursor'
inoremap <C-e> <C-o>$
" overwrites 'insert again'
inoremap <C-a> <C-o>^

if has('clipboard')
	vnoremap <C-c> "+y
else
	vnoremap <C-c> y:call system("xclip -sel c",@0)<cr>
endif
vnoremap <tab> >gv
vnoremap <S-tab> <gv
vnoremap <leader>col :!column -t<cr>
vnoremap s :call VisSurround("inline")<cr>
vnoremap S :call VisSurround("around")<cr>
vnoremap < <gv
vnoremap > >gv

nnoremap ]b :bnext<cr>
nnoremap [b :bprevious<cr>
nnoremap <F14> :execute b:formatter<CR>
nnoremap <F5> :Make<cr>
nnoremap <F17> :execute b:altmakeprg<cr>
nnoremap [q :cp<Cr>
nnoremap ]q :cn<Cr>
nnoremap <A-Down> <c-w>2-
nnoremap <A-Up> <c-w>2+
nnoremap <A-left> <c-w>4<
nnoremap <A-right> <c-w>4>
nnoremap <bs> :set hls!<cr>
nnoremap <C-w>o :tabedit %<cr>
nnoremap <leader>r :set rnu!<cr>
nnoremap gf :e <cfile><CR>
nnoremap <c-w>gf :tabe <cfile><CR>
nmap <leader>gf <C-w>gf
nmap <leader>gF <C-w>gF
nnoremap <leader>/ :let @/='\<<C-R><C-W>\>'<CR>:set hls<CR>
nnoremap <leader>c "+c
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
onoremap u :call search('\u')<cr>
" For Dot
onoremap D :call search('\.')<cr>
" For underScore
onoremap s :call search('_')<cr>

tnoremap <Esc> <C-\><C-N>
