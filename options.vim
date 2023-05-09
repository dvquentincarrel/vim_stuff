" General options
set nocompatible " Vim, not Vi
set tabpagemax=500 " I could get use out of that with my janky homemade tools
set history=5000 " I'm not running this on 2Kb of RAM
set hidden " Hides closed buffers instead of removing them
set noswapfile
set shell=/bin/bash
set timeoutlen=500
set title " Automatically changes title of window to &titlestring
set undofile " Undo history persistence
if !has('nvim')
    set undodir=$CONFIG/undodir
endif
set belloff=all " Disables the bell
set wildmenu " display completion matches in a status line
set mouse=a " Mouse support

" Display
syntax enable
set number " Line numbers
set showcmd " bottom-right display of current spelzl
set laststatus=2 " Status line always displayed
set linebreak " Only breaks long line after last word char
set breakindent " If line wraps, it does so using current indent level
set background=dark " Used for color themes with different omodes
set cursorline " Highlights line cursor is currently on
set scrolloff=5 " How many lines between cursor and edge
set ruler " show the cursor position all the time
highlight Normal ctermbg=None

" Editor options
filetype plugin indent on
set acd " Changes cwd based on current buffer
set ignorecase " Search is case-insensitive by default
set smartcase " Search becomes case-sensitive if uppcase letters are used
set hlsearch " Highlights all match of current search pattern
set incsearch " Searches on every keystroke, not just after pressing CR
set path=.,** " Where to look for files (cwd, and all subdirectories)
set nowrap " Long lines don't wrap automatically
set tabstop=4 " Sizes of a single tab, in spaces
set shiftwidth=4 " How many spaces to use for 'auto' indentation
set softtabstop=4
set expandtab " Tabs are not real tabs, replaced by spaces
set lazyredraw " Is this what's been messing with my md files ? Who knows.
set colorcolumn=80 " Column that is highlighted
set textwidth=0 " No more auto line breaks !
set autoindent " Copies indent from current line to next one on CR or n_o
set smartindent " Guesses when to indent next line
set splitbelow " New vertical splits default to being at the bottom
set splitright " New splits default to being put on the right
set spelllang=fr " For spell checking
set spelloptions=camel " Supports spell checking on camelCased wordGroups
set clipboard^=unnamedplus
set ttimeout " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
set nrformats-=octal " Ignore octal on <C-a> & <C-x>
set backspace=indent,eol,start " Allows backspacing over everything

" External options
set grepformat=%f\ +%l\ :\ %m " Adapted to parsing coffin output
set grepprg=coffin\ -c

" Markdown plugin
let g:markdown_minlines = 250 " Number of lines to look around for markdown syntax context with markdown plugin

" Keywords-mod "plugin"
let g:und_kw = 1 " Used to toggle underscore as a keyword
let g:dot_kw = 0 " Used to toggle dot as a keyword

" Netrw plugin
let g:netrw_banner = 0 " No banner
let g:netrw_winsize = 85 " No half-half
let g:netrw_liststyle = 3 " Tree list
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+' " Hides hidden files
