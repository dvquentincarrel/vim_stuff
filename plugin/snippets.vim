" Very simple plugin to handle snippets stored in files
" This is how you would use this plugin:
" iabbrev <expr> <buffer> doscstring g:snip_pre."docstring.py".g:snip_post

let g:snippets_path = $HOME."/my_repos/vim_stuff/snippets"
let g:snip_pre = ':let @0 = join(readfile("'.g:snippets_path.'/'
let g:snip_post = '"), "\n")0'
