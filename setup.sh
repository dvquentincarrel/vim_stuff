vimdir="$HOME/.vim"
mkdir -p "$vimdir"
for file in abbrevs.vim autocommands.vim \
            mappings.vim options.vim vimrc; do
    ln -si "$PWD/$file" "$vimdir/$file"
done
nvimdir="$HOME/.config/nvim"
mkdir -p "$nvimdir"
ln -si "$PWD/init.vim" "$nvimdir/init.vim"
