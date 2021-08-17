let mapLeader=" "

call plug#begin('~/.vim/plugged')

Plug 'cseelus/vim-colors-lucid'
Plug 'kyoz/purify'
" Plug 'ryanoasis/vim-devicons'
Plug 'vim-python/python-syntax'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'tomasiser/vim-code-dark'
Plug 'zeekay/vim-beautify'
Plug 'kien/ctrlp.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

let NERDTreeShowHidden=1

" autoformat stuff
let g:python3_host_prog="/usr/bin/python3"
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" AIRLINE THEME
let g:airline_theme='powerlineish'

" USER EMMET
let g:user_emmet_leader_key=','

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:prettier#autoformat_require_pragma = 0

" mappings...
map <C-f> :CHADopen<CR>

augroup autoCenter
  autocmd!
  autocmd InsertEnter * normal! zz
augroup END

:au bufenter * silent! GitGutterEnable

set modifiable

set tabstop=2
set shiftwidth=2
set expandtab

set termguicolors
syntax on 
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

set number relativenumber

" Autocompletion

set wildmode=longest,list,full

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:python_highlight_all = 1

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" ----------------------------------------------------------------------------------------------------

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier

let g:rainbow_conf = {
  \	'guifgs': ['#d9b3ff', '#fabfff', '#dfffb5', '#ffd69c', '#a6fff2'],
  \ 'separately': {
  \   'nerdtree': 0,
  \  }
	\  }
