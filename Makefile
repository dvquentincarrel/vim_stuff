targets != which vim >/dev/null && echo install_vim ; which nvim >/dev/null && echo install_nvim

nvimdir = $(HOME)/.config/nvim
vimdir = $(HOME)/.vim

vim_plugin_dirs = airline colors fzf indentline narrow nerdtree signify tagbar tpope undotree xmlruntime
nvim_plugin_dirs = colors lsp treesitter

.PHONY: install uninstall
.PHONY: install_vim install_vim_ini make_vim_dirs get_gruvbox
.PHONY: install_nvim install_nvim_ini make_nvim_dirs 

.IGNORE: install_vim_plugins install_nvim_plugins get_gruvbox uninstall

install: $(targets)
install_vim: install_vim_ini install_vim_plugins get_gruvbox
install_nvim: install_nvim_ini install_nvim_plugins get_gruvbox
get_gruvbox: pack/colors/start/gruvbox%

pack/%/start:
	mkdir -p $@

install_vim_ini: $(vimdir)/vimrc
$(vimdir)/vimrc:
	-@mkdir -p $(vimdir)
	ln -Ts $$PWD/vimrc $(vimdir)/vimrc

make_vim_dirs: $(foreach x,$(vim_plugin_dirs),pack/$(x)/start)
install_vim_plugins: make_vim_dirs
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


install_nvim_ini: $(nvimdir)/init.lua
$(nvimdir)/init.lua:
	-@mkdir -p $(nvimdir)
	ln -Ts $$PWD/init.lua $(nvimdir)/init.lua

make_nvim_dirs: $(foreach x,$(nvim_plugin_dirs),pack/$(x)/start)
install_nvim_plugins: make_nvim_dirs
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

pack/colors/start/gruvbox%:
ifeq ($(shell which nvim >/dev/null ; echo $$?), 0)
	-git -C pack/colors/start clone  https://github.com/ellisonleao/gruvbox.nvim
else
	-git -C pack/colors/start clone  https://github.com/morhetz/gruvbox.git
endif

uninstall:
	rm -rf pack/*
	rm plugin/fzf.vim
