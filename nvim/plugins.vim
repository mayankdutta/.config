call plug#begin("~/.vim/plugged")
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'editorconfig/editorconfig-vim'
Plug 'dag/vim-fish'

Plug 'romainl/vim-cool'

Plug '9mm/vim-closer'

" Plug 'gruvbox-community/gruvbox'
Plug 'lifepillar/vim-gruvbox8'

Plug 'tweekmonster/startuptime.vim'

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'


" Plug 'rbgrouleff/bclose.vim' " something buffer related

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
"
" Plug 'airblade/vim-rooter' " check that if the fzf looking in the project, that we are in, by keeping tracks of git and all.

" Plug 'sheerun/vim-polyglot' "for js and python better hightlighting

" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Keeping up to date with master
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-snippets', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-prettier', 'coc-highlight', 'coc-styled-components', 'coc-react-refactor', 'coc-eslint']  " list of CoC extensions needed
" :CocList extensions

" Plug 'w0rp/ale' " Es lint, intellisense type, but takes lots of time
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align' " for aligning content, see https://github.com/junegunn/vim-easy-align

" for hbs
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'} " tailwind

Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

Plug 'camspiers/lens.vim'
" Plug 'psliwka/vim-smoothie'

" auto changing the matching tag in html css and all.
Plug 'andrewradev/tagalong.vim'

Plug 'mbbill/undotree'

" tpope
Plug 'tpope/vim-haml'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

call plug#end()


set ts=2 sts=2 sw=2 et list lcs=tab:┆·,trail:·,precedes:,extends:
set hid nowrap spr sb ic scs nu rnu tgc nosmd swb=useopen scl=yes nosc noru icm=split
set udir=~/.local/share/nvim/undodir udf
set cot=menuone,noinsert,noselect shm+=c
set bg=dark
colo gruvbox8

let $V=stdpath('config')
" so $V/xstl.vim
" so $V/aesth.vim

if (has("termguicolors"))
  set termguicolors
endif

au BufEnter * if &buftype == 'terminal' | :startinsert | endif " start terminal in insert mode

tnoremap <Esc> <C-\><C-n> " responsible for moving you to ex-command from terminal mode

function! OpenTerminal()
  split term://fish
  resize 28
endfunction
nnoremap <silent> <leader>t :call OpenTerminal()<CR>

function! VerticalOpenTerminal()
  vertical split term://fish
endfunction
nnoremap <silent> <leader>T :call VerticalOpenTerminal()<CR>


" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)


" undo tree
nnoremap <leader>u :UndotreeToggle<CR>

" lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua.require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
