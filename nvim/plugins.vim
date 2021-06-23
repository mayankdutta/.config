call plug#begin("~/.vim/plugged")
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


Plug 'gruvbox-community/gruvbox'
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
" don't forget to install :CocInstall 'coc-json' 'coc-python' 'coc-tsserver' 'coc-html' 'coc-css'
" for help type :CocList commands

" :CocList extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-prettier', 'coc-highlight', 'coc-styled-components', 'coc-react-refactor', 'coc-eslint']  " list of CoC extensions needed

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

" tpope
Plug 'tpope/vim-haml'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

call plug#end()


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
