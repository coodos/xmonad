let mapLeader=" "

call plug#begin('~/.vim/plugged')

Plug 'KeitaNakamura/neodark.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'larsbs/vimterial_dark'
Plug 'kyoz/purify'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'vim-python/python-syntax'
Plug 'ghifarit53/tokyonight-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'tomasiser/vim-code-dark'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'zeekay/vim-beautify'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-autoformat/vim-autoformat'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'sickill/vim-monokai'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
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

" USER EMMET
let g:user_emmet_leader_key=','

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:prettier#autoformat_require_pragma = 0

" mappings...
map <C-f> :NERDTreeToggle<CR>
map <C-/> :NERDCommenterToggle
nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>

set modifiable

set tabstop=2
set shiftwidth=2
set expandtab

set termguicolors
syntax on 
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker'
"colorscheme material

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

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a valid region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

autocmd InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier

let g:rainbow_conf = {
  \	'guifgs': ['#d9b3ff', '#fabfff', '#dfffb5', '#ffd69c', '#a6fff2'],
  \ 'separately': {
  \   'nerdtree': 0,
  \  }
	\  }
