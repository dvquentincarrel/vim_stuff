## Purpose
This repo stores (n)vim config files, along with a list of the plugins used.

## Plugins used
### Vim-compatible
+ [Airline](https://github.com/vim-airline/vim-airline)
+ [Dadbod](https://github.com/tpope/vim-dadbod)
+ [Dbui](https://github.com/kristijanhusak/vim-dadbod-ui)
+ [Fugitive](https://github.com/tpope/vim-fugitive)
+ [Fzf base](https://github.com/junegunn/fzf/tree/master/plugin)
+ [Fzf](https://github.com/junegunn/fzf.vim)
+ [IndentLine](https://github.com/Yggdroot/indentLine)
+ [NERDTree](https://github.com/preservim/nerdtree)
+ [NrrwRgn](https://github.com/chrisbra/NrrwRgn.git)
+ [Signify](https://github.com/mhinz/vim-signify)
+ [Surround](https://github.com/tpope/vim-surround)
+ [Tagbar](https://github.com/preservim/tagbar)
+ [Undotree](https://github.com/mbbill/undotree)
+ [XML runtime](https://github.com/chrisbra/vim-xml-runtime)
### Nvim-only
+ [Gruvbox treesitter](https://github.com/ellisonleao/gruvbox.nvim)
+ [Lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
+ [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
+ [Mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
+ [Mason.nvim](https://github.com/williamboman/mason.nvim)
+ [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
+ [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
+ [Cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
+ [Cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
+ [Cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
+ [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Setting up
just run `make install`, it also downloads the plugins and installs them in this
repository

## Uninstalling
Run `make uninstall`. **THIS WILL REMOVE THE CONTENT OF THE** `pack/` **DIRECTORY, PROCEED WITH CAUTION!**  
Only two-ish things are done outside of this repository by the installation process:
- Creating the `$HOME/.config/nvim/` and `$HOME/.vim/` directories if they don't exist
- Attempting to create an `init.lua` symlink in the `$HOME/.config/nvim/` directory
- Attempting to create an `vimrc` symlink in the `$HOME/.vim/` directory

I leave it up to the user to choose to delete these files, as I would rather not
assume these to be symlinks pointing to this directory.
