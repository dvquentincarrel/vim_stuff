## Purpose
This repo stores (n)vim config files, along with a list of the plugins used.

## Plugins used
+ [Dadbod](https://github.com/tpope/vim-dadbod)
+ [Dbui](https://github.com/kristijanhusak/vim-dadbod-ui)
+ [Fugitive](https://github.com/tpope/vim-fugitive)
+ [Fzf base](https://github.com/junegunn/fzf/tree/master/plugin)
+ [Fzf](https://github.com/junegunn/fzf.vim)
+ [Gruvbox treesitter](https://github.com/ellisonleao/gruvbox.nvim)
+ [NERDTree](https://github.com/preservim/nerdtree)
+ [NrrwRgn](https://github.com/chrisbra/NrrwRgn.git)
+ [Signify](https://github.com/mhinz/vim-signify)
+ [Surround](https://github.com/tpope/vim-surround)
+ [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
+ [Undotree](https://github.com/mbbill/undotree)

## Setting up
just run `make install`, it also downloads the plugins and installs them in this
repository

## Uninstalling
Only two-ish things are done outside of this repository by the installation process:
- Creating the `$HOME/.config/nvim/` and `$HOME/.vim/` directories if they don't exist
- Attempting to create an `init.lua` symlink in the `$HOME/.config/nvim/` directory
- Attempting to create an `vimrc` symlink in the `$HOME/.vim/` directory

I leave it up to the user to delete these files, as I would rather not assume these
to be symlinks pointing to this directory.
