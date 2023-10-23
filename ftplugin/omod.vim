nnoremap <buffer> <CR> :call JumpToModel()<CR>

function JumpToModel()
	let b:lineElems = split(getline('.'), ':')
	let b:path = b:lineElems[0]
	let b:lineNum = b:lineElems[1]
	execute('tabnew +'.b:lineNum.' '.b:path)
endfunction
