vimdir="$HOME/.vim"
mkdir -p "$vimdir"
for file in abbrevs.vim autocommands.vim \
            mappings.vim options.vim vimrc; do
    ln -si "$PWD/$file" "$vimdir/$file"
done

mkdir -p "$vimdir/colors"
wget --directory-prefix "$vimdir/colors/" https://github.com/gruvbox-community/gruvbox/blob/master/colors/gruvbox.vim

nvimdir="$HOME/.config/nvim"
mkdir -p "$nvimdir"
ln -si "$PWD/init.vim" "$nvimdir/init.vim"
