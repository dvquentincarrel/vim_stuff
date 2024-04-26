if ! has('nvim')
    let init_real_path = resolve($HOME.'/.vim/vimrc')
    let $GIT_PATH = substitute(init_real_path, '/vimrc', '', '')
    set runtimepath+=$GIT_PATH
    set runtimepath+=$GIT_PATH/after
    let &packpath = &runtimepath
endif

source $GIT_PATH/options.vim
set runtimepath+=/home/quentin/opi_repo/vim

source $GIT_PATH/mappings.vim

source $GIT_PATH/abbrevs.vim

source $GIT_PATH/autocommands.vim

filetype plugin indent on

"command Make silent make % | redraw! | cw | wincmd k 
command -bar Make silent make | redraw! | cw | wincmd k 
command Reload source ~/.vim/vimrc 
command ExecCurLine exec getline(".")
command Vimrc tabnew ~/.vim/vimrc 
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
command -nargs=1 -bar Read redir @" | silent <args> | redir END
command -nargs=1 -complete=command Tread Read <args> | tabe tread | setl buftype=nofile | setl bufhidden=delete | put \"
" Diffs current buffer with its on-disk version for the times you've messed up (yes, this is :DiffOrig)
command DiffDisk diffthis | vnew | read ++edit # | setl buftype=nofile | 0d_ | diffthis
command Fcl redir @+ | echon expand('%:p') | redir END
command Pcl redir @+ | echon expand('%:p:h') | redir END
command StopLsp lua vim.lsp.stop_client(vim.lsp.get_active_clients())
command StopDiag lua vim.diagnostic.disable()
command Header setlocal sbo=hor | setlocal scrollbind | above 1sp+1


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

try
    colorscheme gruvbox 
    let g:gruvbox_guisp_fallback = "bg"
catch
    try
        colorschem sorbet
    catch
        try
            colorschem habamax
        catch
            colorschem default
        endtry
    endtry
endtry

hi Normal ctermbg=None
