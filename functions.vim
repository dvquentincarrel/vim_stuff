function! LineTabTransfer(source_tab_nb, dest_tab_nb)
	call feedkeys("dd:tabn"..a:dest_tab_nb.."\<CR>p:w\<CR>:tabn"..a:source_tab_nb.."\<CR>:w\<CR>")
endfunction

function! ShiftTab() 
	" WIP: moves the current tab inside a pane of another tab
	let l:curbr = bufnr()
	echo "".l:curbr
endfunction

function! Lint()
	lclose
	if &filetype=='xml' || &filetype == 'html'
		lex system('xmllint --noout '.expand('%'))
    elseif &filetype=='python'
        " TODO: see if there's no issues outside of work
        lex system('pylint -E -dE0401 -dE1101 --output-format=parseable '.expand('%:p'))
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
        if text  =~ "[<>]"
            exec "norm \<Esc>`>a>\<Esc>`<i<\<Esc>"
        elseif text =~ "[()]"
            exec "norm \<Esc>`>a)\<Esc>`<i(\<Esc>"
        elseif text == "[" || text == "]" 
            exec "norm \<Esc>`>a]\<Esc>`<i[\<Esc>"
        elseif text =~ "[{}]"
            exec "norm \<Esc>`>a}\<Esc>`<i{\<Esc>"
        else
            exec "norm \<Esc>`>a".text."\<Esc>`<i".text."\<Esc>"
        endif
    elseif a:type == "around"
        norm '<0O=text'>0o=text
    endif
    set nopaste
endfunction
