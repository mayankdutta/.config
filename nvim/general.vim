set t_Co=256
syntax on

syntax enable
set termguicolors

filetype off
filetype plugin indent on
set ttyfast "helps in fast scrolling of screen

" don't know what this does.
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif

set list                        "show trailing white space
set relativenumber
set showmode                    " always show what mode we're currently editing in
set formatoptions-=cro          " Stop newline continution of comments
set nowrap                      " don't wrap lines
set tags=tags
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase
set timeout timeoutlen=200 ttimeoutlen=100

set visualbell           " don't beep
set noerrorbells         " don't beep

set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files

set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats

set autowrite           "Save on buffer switch
set mouse=a

" don't know what it does
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden

set shortmess+=c   " Shut off completion messages

" increase max memory to show syntax highlighting for large files 
set maxmempattern=20000

" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif


"""" Don't actually know what is this 
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces

"""" Basic Behavior
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu            " visual autocomplete for command menu
set wildmode=longest,list,full "this is autocompletion menu
autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

set lazyredraw          " redraw screen only when we need to, help in fast scrolling of screen
set showmatch           " highlight matching parentheses / brackets [{()}]

""""" status line
set laststatus=2        " enable the status line, if enabled then we can do futher tweaking by set statusline
" for futher tweaking refer to https://shapeshed.com/vim-statuslines/
"set laststatus=0       " to disable the status line 

set showtabline=2       " Always show tabs
" set showtabline=0     " don't show the tabs
set cmdheight=1         " More space for displaying messages

"""" for windows 
set splitbelow          " Horizontal splits will automatically be below
set splitright          " Vertical splits will automatically be to the right


"""" Tab settings
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
" TAB in general mode will move to text buffer
"nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
"nnoremap <S-TAB> :bprevious<CR>




"""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"""" Miscellaneous settings that might be worth enabling
set cursorline         " highlight current line

"set background=dark    " configure Vim to use brighter colors
set autoread           " autoreload the file in Vim if it has been changed outside of Vim

""""indenting
set tabstop=2                           " Insert 2 spaces for a tab
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs
set smarttab
set ruler
set conceallevel=0                      " So that I can see `` in markdown files


" if (has("termguicolors"))
" set termguicolors
" endif

colorscheme dracula
:highlight Comment ctermfg=green " to set comments in green colour


set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
" extra but try what is this 

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif



"" Disable the blinking cursor.

"" Status bar
" set laststatus=2 " already above 

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

set guicursor& " set default setting for cursor

"=====================================================
"===================== STATUSLINE ====================

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%Y-%m-%d %H:%M',
      \'z'    : ' #h',
      \'options' : {'status-justify' : 'left', 'status-position' : 'top'}}
let g:tmuxline_powerline_separators = 0
