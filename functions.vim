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
