targets != which vim >/dev/null && echo install_vim ; which nvim >/dev/null && echo install_nvim
nvimdir=$$HOME/.config/nvim
vimdir=$$HOME/.vim

install: $(targets)
.PHONY install_vim: install_vim_ini make_vim_plugin_dirs install_vim_plugins
.PHONY install_nvim: install_nvim_ini make_nvim_plugin_dirs install_nvim_plugins

.IGNORE install_vim_ini:
	-mkdir -p $(vimdir)
	-ln -Ts $$PWD/vimrc $(vimdir)/vimrc

.IGNORE install_nvim_ini:
	-mkdir -p $(nvimdir)
	-ln -Ts $$PWD/init.lua $(nvimdir)/init.lua

.IGNORE install_vim_plugins: make_vim_plugin_dirs
	-git  -C  pack/airline/start     clone  https://github.com/vim-airline/vim-airline.git
	-git  -C  pack/colors/start      clone  https://github.com/morhetz/gruvbox.git gruvbox_vim
	-git  -C  pack/fzf/start         clone  https://github.com/junegunn/fzf.vim
	-git  -C  pack/indentline/start  clone  https://github.com/Yggdroot/indentLine
	-git  -C  pack/narrow/start      clone  https://github.com/chrisbra/NrrwRgn.git
	-git  -C  pack/nerdtree/start    clone  https://github.com/preservim/nerdtree
	-git  -C  pack/signify/start     clone  https://github.com/mhinz/vim-signify
	-git  -C  pack/tagbar/start      clone  https://github.com/preservim/tagbar
	-git  -C  pack/tpope/start       clone  https://github.com/kristijanhusak/vim-dadbod-ui
	-git  -C  pack/tpope/start       clone  https://github.com/tpope/vim-dadbod
	-git  -C  pack/tpope/start       clone  https://github.com/tpope/vim-fugitive
	-git  -C  pack/tpope/start       clone  https://github.com/tpope/vim-surround
	-git  -C  pack/undotree/start    clone  https://github.com/mbbill/undotree
	-git  -C  pack/xmlruntime/start  clone  https://github.com/chrisbra/vim-xml-runtime

.IGNORE make_vim_plugin_dirs:
	-mkdir -p pack/airline/start
	-mkdir -p pack/colors/start
	-mkdir -p pack/fzf/start
	-mkdir -p pack/indentline/start
	-mkdir -p pack/narrow/start
	-mkdir -p pack/nerdtree/start
	-mkdir -p pack/signify/start
	-mkdir -p pack/tagbar/start
	-mkdir -p pack/tpope/start
	-mkdir -p pack/undotree/start
	-mkdir -p pack/xmlruntime/start

.IGNORE install_nvim_plugins: make_nvim_plugin_dirs
	-git  -C  pack/colors/start      clone  https://github.com/ellisonleao/gruvbox.nvim gruvbox_treesitter
	-git  -C  pack/lsp/start         clone  https://github.com/L3MON4D3/LuaSnip
	-git  -C  pack/lsp/start         clone  https://github.com/VonHeikemen/lsp-zero.nvim
	-git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/cmp-buffer
	-git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/cmp-nvim-lsp
	-git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
	-git  -C  pack/lsp/start         clone  https://github.com/hrsh7th/nvim-cmp
	-git  -C  pack/lsp/start         clone  https://github.com/neovim/nvim-lspconfig
	-git  -C  pack/lsp/start         clone  https://github.com/williamboman/mason-lspconfig.nvim
	-git  -C  pack/lsp/start         clone  https://github.com/williamboman/mason.nvim
	-git  -C  pack/treesitter/start  clone  https://github.com/nvim-treesitter/nvim-treesitter 

.IGNORE make_nvim_plugin_dirs:
	-mkdir -p pack/colors/start
	-mkdir -p pack/lsp/start
	-mkdir -p pack/treesitter/start
