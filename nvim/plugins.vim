
call plug#begin("~/.vim/plugged")
"*****************************************************************************
"                        Plug install packages
"*****************************************************************************

" Plug 'scrooloose/nerdtree' takes time and still unstable with icons
" Plug 'ryanoasis/vim-devicons' "for icons 
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'rbong/vim-crystalline' "status line 

Plug 'rbgrouleff/bclose.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " check that if the fzf looking in the project, that we are in, by keeping tracks of git and all.
" Plug 'sheerun/vim-polyglot' "for js and python better hightlighting

" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

" don't forget to install :CocInstall 'coc-json' 'coc-python' 'coc-tsserver' 'coc-html' 'coc-css'
" for help type :CocList commands
" :CocList extensions

" let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

" Plug 'w0rp/ale' " Es lint, intellisense type, but takes lots of time 

Plug 'junegunn/vim-easy-align' " for aligning content, see https://github.com/junegunn/vim-easy-align

Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'


" === Syntax Highlighting === "

" Syntax highlighting for nginx
" Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
" Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
" Plug 'othree/yajs.vim'

" === Javascript Plugins === "
" Typescript syntax highlighting
" Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
" Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
" Plug 'heavenshell/vim-jsdoc'

" for hbs 
Plug 'joukevandermaas/vim-ember-hbs'


"*****************************************************************************
""                          Custom bundles
"*****************************************************************************

call plug#end()


if (has("termguicolors"))
  set termguicolors
endif


" nerd tree mess
"let g:NERDTreeShowHidden = 1
"let g:NERDTreeMinimalUI = 1
"let g:NERDTreeIgnore = []
"let g:NERDTreeStatusline = ''
"
"" Automaticaly close nvim if NERDTree is only thing left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" Toggle
"
"" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
"nnoremap <silent> <leader>b :NERDTreeToggle<CR>
"
"tnoremap <Esc> <C-\><C-n>
" nerd tree mess


" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif


function! OpenTerminal()
  split term://fish
  resize 28
endfunction
nnoremap <leader>n :call OpenTerminal()<CR>
" nnoremap <silent> <C-n> :call OpenTerminal()<CR>


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


" Equivalent to the above.
" let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['eslint'],
" \}
" 
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
" let g:ale_fix_on_save = 1
" let g:airline#extensions#ale#enabled = 1



"" easy align, plugin 
xmap ga <Plug>(EasyAlign) " Start interactive EasyAlign in visual mode (e.g. vipga)

nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)



" for ranger 
let g:ranger_map_keys = 0
map <leader>b :Ranger<CR>.
