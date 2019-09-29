
"Pathogen Plugin Manager
execute pathogen#infect()
syntax on
filetype plugin indent on

"Ayu Colorscheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let ayucolor='mirage'
colorscheme ayu

"Splits
set splitbelow
set splitright

"Quit & Save Shortcut
nnoremap QQ ZQ

"Wildmenu
set wildmenu

"Show Current Position
set ruler

"Search
set ignorecase
set smartcase
set hlsearch
set incsearch

"Incsearch Plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"Show Matching Brackets
set showmatch
set mat=2

"Ignore Error Sounds
set vb t_vb=

"Add Some Space On The Left
"Also Show Line Numbers
set foldcolumn=1
set number
set relativenumber

"Setting Character Encoding
set encoding=utf8

"Smart Tabbing
set smarttab
set shiftwidth=4
set tabstop=4

"Indenting
set ai
set si
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

"Window Movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Mouse Support Because I Am Weak
set mouse=a
