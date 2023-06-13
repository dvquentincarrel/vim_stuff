"source $VIMRUNTIME/defaults.vim

let $CONFIG=$HOME."/.vim/"

source $CONFIG/options.vim

source $CONFIG/mappings.vim

source $CONFIG/abbrevs.vim

source $CONFIG/autocommands.vim

filetype plugin indent on

"command Make silent make % | redraw! | cw | wincmd k 
command -bar Make silent make | redraw! | cw | wincmd k 
command Reload source ~/.vim/vimrc 
command ExecCurLine exec getline(".")
command Vimrc tabnew ~/.vim/vimrc 
command TDelta exec "read !calc_duration ". getline(".")
command TAdd exec "read !calc_duration -m add ". getline(".")
command -nargs=? Lorem read !lorem <args> 
command WW w !sudo tee %
command W w
command Splitattrs s/<\w* /&\r/ | s/" /"\r/g | s/\/\?>/\r&/
command Numcount echo system('sed "' . line(".") . 'q;d" ' . expand('%') . ' | wc -w | tr -d "\n"')
command -bar Inject w | !dataer inject
command MI Make | silent Inject | redraw!
command -range Dictify :'<,'>norm I'ea'yi'$a : ,hp
command Lint call Lint()
command Scrub call prop_clear(1, getbufinfo(bufnr(""))[0]['linecount']) " Removes all virtual text from current buffer
command -nargs=? -bar Tabs set tabstop=<args> | set shiftwidth=<args>


function! LineTabTransfer(source_tab_nb, dest_tab_nb)
	call feedkeys("dd:tabn"..a:dest_tab_nb.."\<CR>p:w\<CR>:tabn"..a:source_tab_nb.."\<CR>:w\<CR>")
endfunction

function! ShiftTab() 
	" WIP: moves the current tab inside a pane of another tab
	let l:curbr = bufnr()
	echo "".l:curbr
endfunction

function! ExecBind()
	" Makes <F6> run the current file, and <F7> run in debugger (if applicable)
	if &filetype == 'markdown'
		nnoremap <buffer> <F6> :exec 'silent! !cmark-gfm -e tasklist --unsafe "%:p" \| sed s/disabled=\"\"// > /tmp/%:r.html && firefox --new-window /tmp/%:r.html' \| redraw!<cr>
		nnoremap <buffer> <F8> :exec 'silent! !cmark-gfm -e tasklist --unsafe "%:p" \| sed s/disabled=\"\"// > %:r.html && firefox %:r.html' \| redraw!<cr>
		" nnoremap <F6> :exec 'silent! !cmark-gfm --unsafe "%:p" > /tmp/html_md.html && firefox --new-window /tmp/html_md.html' \| redraw!<cr>
	elseif &filetype == 'python'
		nnoremap <buffer> <F6> :tab term python -i "%:p"<cr>
	elseif &filetype == 'bash'
		nnoremap <buffer> <F6> :!./"%:p"
	elseif &filetype == 'java'
		nnoremap <buffer> <F6> :tab term java %:r<cr>
		nnoremap <buffer> <F7> :tab term jdb %:r<cr>
	endif
endfunction

function! CommentLine()
    if &filetype == 'xml' || &filetype == 'html' || &filetype == 'markdown'
        nmap <buffer> <leader># I<!-- <C-o>$ --><esc><<
        vmap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>
    else
    endif
endfunction

function! AdaptFold()
    if &filetype == 'python' || &filetype == 'xml' || &filetype == 'html'
        set foldmethod=indent
    else
        set foldmethod=manual
    endif
endfunction

function! ToggleUndKword()
    if g:und_kw == 1
        set iskeyword-=_
        let g:und_kw = 0
        echo "_ delimits"
    else
        set iskeyword+=_
        let g:und_kw = 1
        echo "_ blends in"
    endif
endfunction

function! ToggleDotKword()
    if g:dot_kw == 1
        set iskeyword-=.
        let g:dot_kw = 0
        echo ". delimits"
    else
        set iskeyword+=.
        let g:dot_kw = 1
        echo ". blends in"
    endif
endfunction

function! TagJump()
	let l:curline = line(".")
		normal vat
	if l:curline == line("'>")
		normal o
	endif
	normal 
endfunction

function! Lint()
	lclose
	if &filetype=='xml'
		lex system('xmllint --noout '.expand('%'))
	endif
	if v:shell_error == 0
		echo "no error"
	else
		lw
		norm w
	endif
endfunction

" Prompts the user for a string to surround its selection with
function! VisSurround(type) range
    let text = input('Value: ')
    " Go to start of selection, prepend value. Go to end of selection, append value
    set paste
    if a:type == "inline"
        if text == " <"
            norm `>a>`<i<
        elseif text == " ("
            norm `>a)`<i(
        elseif text == " ["
            norm `>a]`<i[
        elseif text == " {"
            norm `>a}`<i{
        else
            norm `<i=text`>a=text
        endif
    elseif a:type == "around"
        norm '<0O=text'>0o=text
    endif
    set nopaste
endfunction

let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox 
