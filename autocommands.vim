" augroup DEBUG
" 	autocmd!
" 	au TextYankPost * {
" 	}
" augroup END


" augroup auto_fdc
" 	autocmd!
" 	let g:auto_fdc = 1
" 		autocmd CursorMoved * {
" 		# TODO: get through vim9
" 		#	if g:auto_fdc == 1
" 		#		var tmp_fdc = foldlevel(line('.')) + 1
" 		#		if tmp_fdc > 12
" 		#		#	 var tmp_fdc = 12
" 		#		endif
" 		#		&fdc = tmp_fdc
" 		#	endif
" 		}
" augroup END

augroup tab_name
	autocmd!
	autocmd BufEnter * let &titlestring = ' '.expand("%:t")
augroup END

augroup mem_folds
	" Automatically saves and load the view
	autocmd!
	autocmd BufWrite * mkview
	autocmd BufRead * silent! loadview
augroup END

" DEPRECATED. TODO: nice implmentation which checks if compiled with acd, and uses that otherwise
" augroup cur_cd
" 	" Automatically changes cwd to that of the current buffer
" 	autocmd!
" 	autocmd BufEnter * silent! cd %:h
" augroup END

augroup ft_adapt
	" Automatically adapts to the current filetype by
	" settings the compiler, how to run the file, and
	" creating relevant abberevations
	autocmd!
	autocmd FileType * try | execute "compiler" &filetype | catch | endtry
	"autocmd BufWritePost * Make "Un peu relou en vrai
	autocmd FileType * call ExecBind()
	autocmd FileType * call CommonAbbr()
	autocmd FileType * call CommentLine()
	autocmd Filetype help setlocal number
	autocmd BufEnter * call ExecBind()
	autocmd BufEnter * call CommonAbbr()
	autocmd BufEnter * call CommentLine()
	autocmd FileType help setlocal number
augroup END

if !has('nvim')
    augroup keep_clip
        " Keeps clipboard on vim exit
        autocmd VimLeave * call system("xclip -sel c", getreg('+'))
    augroup END
endif
