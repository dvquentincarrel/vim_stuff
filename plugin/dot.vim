command! -range Dot exec "silent '<,'>w !dot -Tpng > /tmp/dot.png; xdg-open /tmp/dot.png&"
