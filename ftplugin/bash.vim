nnoremap <buffer> <F6> :!./"%:p"

iabbrev <buffer> getopts 
\read -rd '' help_msg <<EOF
\<cr>Usage: {%%}
\<cr>{%%}
\<cr>EOF
\<cr>
\<cr>while getopts "h" opt; do
\<cr>case $opt in
\<cr>h)  echo "$help_msg"
\<cr>exit 0;;
\<cr>\<BS>*)  echo "invalid option '$opt'"
\<cr>exit 1;;
\<cr>esac
\<cr>done
\<cr>shift $((OPTIND -1))
