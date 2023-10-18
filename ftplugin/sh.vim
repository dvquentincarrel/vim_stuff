nnoremap <buffer> <F6> :!./"%:p"

iabbrev <buffer> getopts 
\while getopts "h" opt; do
\<cr>case $opt in
\<cr>h) echo "TODO";;
\<cr>*) echo "invalid option '$opt'"
\<cr>	exit 1;;
\<cr>esac
\<cr>done
\<cr>shift $((OPTIND -1))
