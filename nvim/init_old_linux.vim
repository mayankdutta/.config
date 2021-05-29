nnoremap <SPACE> <Nop>
let mapleader=" "

set nocompatible   " Disable vi-compatibility
set t_Co=256
syntax on
filetype off
filetype plugin indent on
set ttyfast "helps in fast scrolling of screen

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
set autowrite           "Save on buffer switch
set mouse=a
"set clipboard=unnamed                                        " yank and paste with the system clipboard


"""" Don't actually know what is this 
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces

"""" Basic Behavior
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu            " visual autocomplete for command menu
set wildmode=longest,list,full "this is autocompletion menu
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set lazyredraw          " redraw screen only when we need to, help in fast scrolling of screen
set showmatch           " highlight matching parentheses / brackets [{()}]

""""" status line
set laststatus=2        " enable the status line, if enabled then we can do futher tweaking by set statusline
                        "for futher tweaking refer to https://shapeshed.com/vim-statuslines/
"set laststatus=0       " to disable the status line 

set showtabline=2                       " Always show tabs
" set showtabline=0                       " don't show the tabs
set cmdheight=1                         " More space for displaying messages

"""" for windows 
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

" Better window navigation
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

" map <leader>h <Nop>
" map <leader>j <Nop>
" map <leader>k <Nop>
" map <leader>l <Nop>

" nnoremap <leader>h <C-w>h
" nnoremap <leader>j <C-w>j
" nnoremap <leader>k <C-w>k
" nnoremap <leader>l <C-w>l


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



call plug#begin("~/.vim/plugged")
" Plugin Section

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons' "for icons 
Plug 'dracula/vim' "theme 
Plug 'rbong/vim-crystalline' "status line 

" fzf stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " check that if the fzf looking in the project, that we are in, by keeping tracks of git and all.

Plug 'sheerun/vim-polyglot' "for js and python better hightlighting

"for node js
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint']
"for node js

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"vim surround as was mentioned in the book
Plug 'tpope/vim-surround'
Plug 'bfrg/vim-cpp-modern' 
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }



"Plug 'bling/vim-airline'


call plug#end()
"Config Section

if (has("termguicolors"))
  set termguicolors
endif
syntax enable

colorscheme dracula
:highlight Comment ctermfg=green " to set comments in green colour

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" nnoremap <silent> <leader>d :NERDTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://fish
  resize 25
endfunction
nnoremap <leader>n :call OpenTerminal()<CR>


"for crystalline


" fzf configuration
" install dependencies first : https://www.chrisatmachine.com/Neovim/08-fzf/

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" map <C-f> :Files<CR>
nnoremap <leader>f :Files<CR>
" map <C-g> :Rg<CR>
nnoremap <leader>g :Rg<CR>
"
" map <leader>b :Buffers<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " ignoring node modules 



" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" end of fzf configuration


