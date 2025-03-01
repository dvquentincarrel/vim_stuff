" General options
if v:progname == 'vi'
    set compatible
endif
set tabpagemax=500 " I could get use out of that with my janky homemade tools
set history=5000 " I'm not running this on 2Kb of RAM
set hidden " Hides closed buffers instead of removing them
set shell=/bin/bash
set timeoutlen=1000
set title " Automatically changes title of window to &titlestring
set undofile " Undo history persistence
if !has('nvim')
    set undodir=$GIT_PATH/undodir
    set viminfo='1000,<50,s10,h
else
    set shada=!,'1000,<50,s10,h
endif
set belloff=all " Disables the bell
set wildmenu " display completion matches in a status line
set mouse=a " Mouse support
set wildignore+=*.pyc,node_modules
set updatetime=300 " timeout before writing to swap file or triggering CursorHold event
set switchbuf=usetab " Goes to open window if it exists, instead of replacing current one
if(len(expand('%:p')) > 100)
    set noswapfile
endif

" Display
set number " Line numbers
set norelativenumber " Absolute line numbers
set showcmd " bottom-right display of current spelzl
set laststatus=2 " Status line always displayed
set linebreak " Only breaks long line after last word char
set breakindent " If line wraps, it does so using current indent level
set background=dark " Used for color themes with different omodes
set cursorline " Highlights line cursor is currently on
set scrolloff=2 " How many lines between cursor and edge
set sidescrolloff=5 " How many lines between cursor and horizontal edge
set ruler " show the cursor position all the time
set foldmethod=indent " Generally saner than alternatives
set foldtext= " Allows reusing of highlights, 
set foldignore= " Default is to ignore comments when fdm=indent, it's awful
set nofoldenable " User is required to `zi` to enable folds
if v:progname != 'vi'
    set listchars=tab:¦\ ,trail:·,nbsp:+,lead:\ 
endif
set conceallevel=1
if has('nvim')
    setglobal signcolumn=auto:2
endif
highlight Normal ctermbg=None

" Editor options
filetype plugin indent on
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
if v:progname != 'vi'
    set spelloptions=camel " Supports spell checking on camelCased wordGroups
endif
set clipboard^=unnamedplus
set ttimeout " Key sequences never stop waiting
set timeout " Key sequences never stop waiting
set nrformats-=octal " Ignore octal on <C-a> & <C-x>
set backspace=indent,eol,start " Allows backspacing over everything
set list " For trailing whitespaces & tabs markup
set nofixeol " Reduces diffs. Besides, if your codebase has these, it most likely has bigger issues

" External options
set grepprg=rg\ --vimgrep
" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif
" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" Keywords-mod "plugin"
let g:und_kw = 1 " Used to toggle underscore as a keyword
let g:dot_kw = 0 " Used to toggle dot as a keyword

" Netrw plugin
let g:netrw_banner = 0 " No banner
let g:netrw_winsize = 85 " No half-half
let g:netrw_liststyle = 3 " Tree list
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+' " Hides hidden files

" NerdTREE plugin
let NERDTreeRespectWildIgnore=1
let NERDTreeMouseMode=3

let b:altmakeprg = 'silent !true'
