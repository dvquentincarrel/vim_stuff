#!/bin/sh
nvimdir="$HOME/.config/nvim"
vimdir="$HOME/.vim"
vim_plugin_dirs="airline colors fzf indentline narrow nerdtree signify smoothie tagbar tpope undotree xmlruntime"
nvim_plugin_dirs="lsp treesitter dap devicons dressing luasnip oil"

which vim >/dev/null && mkdir -p "$vimdir"
which nvim >/dev/null && mkdir -p "$nvimdir"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "To install the files, run:"
    echo "\t./install.sh"
    echo "To uninstall the files, run:"
    echo "\t./install.sh -u"
    exit 0
elif [ "$1" = "-u" ]; then
    printf "\e[1mRemoving plugins...\e[m\n"
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

printf "\e[1mInstalling init files...\e[m\n"
[ -e "$vimdir/vimrc" ] || ln -Ts "$PWD"/vimrc "$vimdir"/vimrc
[ -e "$nvimdir/init.lua" ] || ln -Ts "$PWD"/init.lua "$nvimdir"/init.lua

printf "\n\e[1mInstalling Plugins...\e[m\n"
for dir in $vim_plugin_dirs; do
    mkdir -p pack/$dir/opt
done
git  -C  pack/airline/opt           clone  https://github.com/vim-airline/vim-airline.git
git  -C  pack/fzf/opt               clone  https://github.com/junegunn/fzf.vim
wget -P  plugin --quiet --no-clobber 'https://raw.githubusercontent.com/junegunn/fzf/master/plugin/fzf.vim'
git  -C  pack/narrow/opt            clone  https://github.com/chrisbra/NrrwRgn.git
git  -C  pack/nerdtree/opt          clone  https://github.com/preservim/nerdtree
git  -C  pack/signify/opt           clone  https://github.com/mhinz/vim-signify
git  -C  pack/smoothie/opt          clone  https://github.com/psliwka/vim-smoothie.git
git  -C  pack/tagbar/opt            clone  https://github.com/preservim/tagbar
git  -C  pack/tpope/opt             clone  https://github.com/kristijanhusak/vim-dadbod-ui
git  -C  pack/tpope/opt             clone  https://github.com/tpope/vim-dadbod
git  -C  pack/tpope/opt             clone  https://github.com/tpope/vim-fugitive
git  -C  pack/tpope/opt             clone  https://github.com/tpope/vim-surround
git  -C  pack/undotree/opt          clone  https://github.com/mbbill/undotree
git  -C  pack/xmlruntime/opt        clone  https://github.com/chrisbra/vim-xml-runtime
if which nvim >/dev/null; then
    for dir in $nvim_plugin_dirs; do
        mkdir -p pack/$dir/opt
    done
    git  -C  pack/lsp/opt         clone  https://github.com/VonHeikemen/lsp-zero.nvim
    git  -C  pack/lsp/opt         clone  https://github.com/hrsh7th/cmp-buffer
    git  -C  pack/lsp/opt         clone  https://github.com/hrsh7th/cmp-nvim-lsp
    git  -C  pack/lsp/opt         clone  https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    git  -C  pack/lsp/opt         clone  https://github.com/hrsh7th/nvim-cmp
    git  -C  pack/lsp/opt         clone  https://github.com/neovim/nvim-lspconfig
    git  -C  pack/lsp/opt         clone  https://github.com/williamboman/mason-lspconfig.nvim
    git  -C  pack/lsp/opt         clone  https://github.com/williamboman/mason.nvim
    git  -C  pack/lsp/opt         clone  https://github.com/SmiteshP/nvim-navic.git
    git  -C  pack/treesitter/opt  clone  https://github.com/nvim-treesitter/nvim-treesitter
    git  -C  pack/treesitter/opt  clone  https://github.com/nvim-treesitter/nvim-treesitter-refactor.git
    git  -C  pack/treesitter/opt  clone  https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git
	git  -C  pack/colors/opt      clone  https://github.com/ellisonleao/gruvbox.nvim
    git  -C  pack/dap/opt         clone  https://github.com/mfussenegger/nvim-dap.git
    git  -C  pack/dap/opt         clone  https://github.com/rcarriga/nvim-dap-ui.git
    git  -C  pack/dap/opt         clone  https://github.com/theHamsta/nvim-dap-virtual-text.git
    git  -C  pack/dap/opt         clone  https://github.com/nvim-neotest/nvim-nio.git
    git  -C  pack/dap/opt         clone  https://github.com/mfussenegger/nvim-dap-python.git
    git  -C  pack/fzf/opt         clone  https://github.com/ibhagwan/fzf-lua.git
    git  -C  pack/devicons/opt    clone  https://github.com/nvim-tree/nvim-web-devicons
    git  -C  pack/dressing/opt    clone  https://github.com/stevearc/dressing.nvim.git
    git  -C  pack/luasnip/opt     clone  https://github.com/L3MON4D3/LuaSnip.git
    git  -C  pack/indentline/opt  clone  https://github.com/lukas-reineke/indent-blankline.nvim.git
else # Vim-only variants
	git  -C  pack/colors/opt      clone  https://github.com/morhetz/gruvbox.git
    git  -C  pack/indentline/opt        clone  https://github.com/Yggdroot/indentLine
fi

printf "\e[1mGenerating help tags...\e[m\n"
vim +'helptags ALL | q'
