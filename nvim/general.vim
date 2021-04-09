set t_Co=256
syntax on

set hidden                                 "     for coc, also something for buffers
syntax enable
set termguicolors

filetype off
filetype plugin indent on
set ttyfast                                "     helps in fast scrolling of screen

set list                                   "     show trailing white space
set relativenumber
set showmode                               "     always show what mode we're currently editing in
set nowrap                                 "     don't wrap lines
set backspace=indent,eol,start             "     allow backspacing over everything in insert mode
set number                                 "     always show line numbers

set smartcase                              "     turn on case sensitive, if any capital letter enterred.
set incsearch                              "     search as characters are entered
set hlsearch                               "     highlight matches

set visualbell                             "     don't beep
set noerrorbells                           "     don't beep

set noswapfile                             "     Don't use swapfile
set nobackup                               "     Don't create annoying backup files, also required for coc

set fileformats=unix,dos,mac               "     Prefer Unix over Windows over OS 9 formats

set autowrite                              "     Save on buffer switch
set mouse=a

                                           "     don't know what it does
                                           "     switching them on will make redrawing on screen slower
set nocursorcolumn                         "     speed up syntax highlighting
set nocursorline                           "     removing no to this, will highlight the current line but will make the screen redrawing slower
set signcolumn=yes

set pumheight=10                           "     Completion window max size

set maxmempattern=20000                    "     increase max memory to show syntax highlighting for large files

set viminfo='1000                          "     recently opened files, :FzfHistory uses it


set scrolloff=8                            "     show context above/below cursorline
set shiftwidth=2                           "     normal mode indentation commands use 2 spaces

""""  Basic Behavior
set encoding=utf-8                         "     set encoding to UTF-8 (default was "latin1") " also for coc
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                               "     enhanced command line completion
set wildmode=longest,list,full             "     completes files like a shell
autocmd VimResized * :wincmd =             "     automatically rebalance windows on vim resize

set lazyredraw                             "     redraw screen only when we need to, help in fast scrolling of screen
set showmatch                              "     highlight matching parentheses / brackets [{()}]

""""" status line
set laststatus=2                           "     enable the status line, if enabled then we can do futher tweaking by set statusline
                                           "     for futher tweaking refer to https://shapeshed.com/vim-statuslines/
                                           "     set laststatus=0       " to disable the status line

set showtabline=2                          "     Always show tabs
                                           "     set showtabline=0     " don't show the tabs
set cmdheight=2                            "     More space for displaying messages

""""  for windows
set splitbelow                             "     Horizontal splits will automatically be below
set splitright                             "     Vertical splits will automatically be to the right


set autoread                               "     autoreload the file in Vim if it has been changed outside of Vim

set tabstop=2                              "     Insert 2 spaces for a tab
set softtabstop=4                          "     backspace after pressing <TAB> will remove up to this many spaces
set expandtab                              "     don't use actual tab character (ctrl-v)
set shiftwidth=2                           "     Change the number of space characters inserted for indentation
set shiftround                             "     use multiple of shiftwidth when indenting with '<' and '>'
set smarttab                               "     tab respects 'tabstop', 'shiftwidth' and 'softtabstop'

set autoindent                             "     turns it on
set copyindent                             "     copy the previous indentation on autoindenting
set smartindent                            "     does the right thing (mostly) in programs

set cindent                                "     stricter rules for C programs
set ruler
set conceallevel=0                         "     So that I can see `` in markdown files

                                           "     TAB in general mode will move to text buffer
                                           "     nnoremap <TAB> :bnext<CR>
                                           "     SHIFT-TAB will go back
                                           "     nnoremap <S-TAB> :bprevious<CR>

" colorscheme dracula
colorscheme gruvbox
" :highlight Comment ctermfg=green           "     to set comments in green colour

                                           ""    Use modeline overrides
                                           "     set modeline
                                           "     set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

set guicursor&                             "     set default setting for cursor

      "     =====================================================
      "     ===================== STATUSLINE ====================

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%Y-%m-%d %H:%M',
      \'z'    : ' #h',
      \'options' : {'status-justify' : 'left', 'status-position' : 'top'}}
let g:tmuxline_powerline_separators = 0
