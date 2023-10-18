nnoremap <buffer> <F6> :tab term java %:r<cr>
nnoremap <buffer> <F7> :tab term jdb %:r<cr>

iabbrev <buffer> sout System.out.println("");<Left><Left><Left>
iabbrev <buffer> linfo( LOGGER.log(Level.INFO, "");<Left><Left><Left><bs>
iabbrev <buffer> main( public static void main(String args[]){ 
\<cr>}
