if exists("b:current_syntax")
    finish
endif

syntax match omodLine "\v\d+$"
syntax match omodFile "\v^\S*\ze:"
highlight link omodLine CursorLineNr
highlight link omodFile Directory
