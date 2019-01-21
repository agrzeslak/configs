syntax enable

filetype off
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set relativenumber
set showcmd
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set wildmode=full

let g:netrw_liststyle=3
let g:netrw_preview=1

if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme evening
endif
