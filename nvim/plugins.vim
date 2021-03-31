let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))


call plug#begin("~/.vim/plugged")
"*****************************************************************************
"" Plug install packages
"*****************************************************************************

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs' " see no longer maintained scene
Plug 'ryanoasis/vim-devicons' "for icons 
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " check that if the fzf looking in the project, that we are in, by keeping tracks of git and all.
Plug 'sheerun/vim-polyglot' "for js and python better hightlighting

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed
Plug 'w0rp/ale' " Es lint, intellisense type, but takes lots of time 

Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-fugitive'   "something related to git
" Plug 'vim-airline/vim-airline' will slow down your stuff greatly
" Plug 'vim-airline/vim-airline-themes'
" Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/grep.vim'
Plug 'majutsushi/tagbar' " https://github.com/preservim/tagbar
Plug 'Yggdroot/indentLine' " for indenting lines, I think this is imp
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

Plug 'pangloss/vim-javascript' 
Plug 'sheerun/vim-polyglot' " for hightlighting
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'nathanaelkane/vim-indent-guides'

" not working now, will have to work on mapping
Plug 'junegunn/vim-easy-align' " important 
" try these commands:
"" vipga=
"""" visual-select inner paragraph
"""" Start EasyAlign command (ga)
"""" Align around =
"" gaip=
"""" Start EasyAlign command (ga) for inner paragraph
"""" Align around =

Plug 'cometsong/CommentFrame.vim' " how to use, pic saved to desktop
" press leader and then one from the images there.


"*****************************************************************************
"" Custom bundles
"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

call plug#end()


if (has("termguicolors"))
  set termguicolors
endif

colorscheme dracula
:highlight Comment ctermfg=green " to set comments in green colour


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle

" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>b :NERDTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif


" open terminal on ctrl+n
function! OpenTerminal()
  split term://fish
  resize 28
endfunction
" nnoremap <leader>n :call OpenTerminal()<CR>
nnoremap <silent> <C-n> :call OpenTerminal()<CR>



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

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " ignoring node modules 

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" extra but try what is this 
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

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


" setting up es lint
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1



"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

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


"" easy align, plugin 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
