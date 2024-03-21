#!/bin/sh
nvimdir="$HOME/.config/nvim"
vimdir="$HOME/.vim"
vim_plugin_dirs="airline colors fzf indentline narrow nerdtree signify tagbar tpope undotree xmlruntime"
nvim_plugin_dirs="lsp treesitter"

which vim >/dev/null && mkdir -p "$vimdir"
which nvim >/dev/null && mkdir -p "$nvimdir"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "To install the files, run:"
    echo "\t./install.sh"
    echo "To uninstall the files, run:"
    echo "\t./install.sh -u"
    exit 0
elif [ "$1" = "-u" ]; then
    echo "\e[1mRemoving plugins...\e[m"
    [ -e "plugin/fzf.vim" ] && rm -v plugin/fzf.vim
    [ -d "pack" ] && rm -vrf ./pack

    echo '\nOnly two-ish things are done outside of this repository by the installation process:'
    echo '- Creating the "$HOME/.config/nvim/" and "$HOME/.vim/" directories if they '"don't exist"
    echo '- Attempting to create an `init.lua` symlink in the `$HOME/.config/nvim/` directory'
    echo '- Attempting to create an `vimrc` symlink in the `$HOME/.vim/` directory'
    echo ''
    echo 'I leave it up to the user to choose to delete these files, as I would rather not'
    echo 'assume these to be symlinks pointing to this directory.'
    exit 0
fi

echo "\e[1mInstalling init files...\e[m"
[ -e "$vimdir/vimrc" ] || ln -Ts "$PWD"/vimrc "$vimdir"/vimrc
[ -e "$nvimdir/init.lua" ] || ln -Ts "$PWD"/init.lua "$nvimdir"/init.lua

echo "\n\e[1mInstalling Plugins...\e[m"
for dir in $vim_plugin_dirs; do
    mkdir -p pack/$dir/start
done
git  -C  pack/airline/start           clone  https://github.com/vim-airline/vim-airline.git
git  -C  pack/fzf/start               clone  https://github.com/junegunn/fzf.vim
wget -P  plugin --quiet --no-clobber 'https://raw.githubusercontent.com/junegunn/fzf/master/plugin/fzf.vim'
git  -C  pack/indentline/start        clone  https://github.com/Yggdroot/indentLine
git  -C  pack/narrow/start            clone  https://github.com/chrisbra/NrrwRgn.git
git  -C  pack/nerdtree/start          clone  https://github.com/preservim/nerdtree
git  -C  pack/signify/start           clone  https://github.com/mhinz/vim-signify
git  -C  pack/tagbar/start            clone  https://github.com/preservim/tagbar
git  -C  pack/tpope/start             clone  https://github.com/kristijanhusak/vim-dadbod-ui
git  -C  pack/tpope/start             clone  https://github.com/tpope/vim-dadbod
git  -C  pack/tpope/start             clone  https://github.com/tpope/vim-fugitive
git  -C  pack/tpope/start             clone  https://github.com/tpope/vim-surround
git  -C  pack/undotree/start          clone  https://github.com/mbbill/undotree
git  -C  pack/xmlruntime/start        clone  https://github.com/chrisbra/vim-xml-runtime
if which nvim >/dev/null; then
    for dir in $nvim_plugin_dirs; do
        mkdir -p pack/$dir/start
    done
    git  -C  pack/lsp/start         clone  https://github.com/L3MON4D3/LuaSnip
    git  -C  pack/lsp/start         clone  https://github.com/VonHeikemen/lsp-zero.nvim
    git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/cmp-buffer
    git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/cmp-nvim-lsp
    git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/nvim-cmp
    git  -C  pack/lsp/start         clone  https://github.com/neovim/nvim-lspconfig
    git  -C  pack/lsp/start         clone  https://github.com/williamboman/mason-lspconfig.nvim
    git  -C  pack/lsp/start         clone  https://github.com/williamboman/mason.nvim
    git  -C  pack/treesitter/start  clone  https://github.com/nvim-treesitter/nvim-treesitter
	git  -C  pack/colors/start      clone  https://github.com/ellisonleao/gruvbox.nvim
else
	git  -C  pack/colors/start      clone  https://github.com/morhetz/gruvbox.git
fi
