nvimdir=$$HOME/.config/nvim
vimdir=$$HOME/.vim

.IGNORE install: install_plugins install_ini

.IGNORE install_plugins: make_plugin_dirs
	git  -C  pack/colors/start      clone  https://github.com/ellisonleao/gruvbox.nvim
	git  -C  pack/fzf/start         clone  https://github.com/junegunn/fzf.vim
	git  -C  pack/narrow/start      clone  https://github.com/chrisbra/NrrwRgn.git
	git  -C  pack/nerdtree/start    clone  https://github.com/preservim/nerdtree
	git  -C  pack/signify/start     clone  https://github.com/mhinz/vim-signify
	git  -C  pack/tpope/start       clone  https://github.com/tpope/vim-dadbod
	git  -C  pack/tpope/start       clone  https://github.com/tpope/vim-fugitive
	git  -C  pack/tpope/start       clone  https://github.com/tpope/vim-surround
	git  -C  pack/tpope/start       clone  https://github.com/kristijanhusak/vim-dadbod-ui
	git  -C  pack/treesitter/start  clone  https://github.com/nvim-treesitter/nvim-treesitter
	git  -C  pack/undotree/start    clone  https://github.com/mbbill/undotree

.IGNORE make_plugin_dirs:
	mkdir -p pack/colors/start
	mkdir -p pack/fzf/start
	mkdir -p pack/narrow/start
	mkdir -p pack/nerdtree/start
	mkdir -p pack/signify/start
	mkdir -p pack/tpope/start
	mkdir -p pack/treesitter/start
	mkdir -p pack/undotree/start

.IGNORE install_ini:
	mkdir -p $(nvimdir) $(vimdir)
	ln -Ts $$PWD/init.lua $(nvimdir)/init.lua
	ln -Ts $$PWD/vimrc $(vimdir)/vimrc
