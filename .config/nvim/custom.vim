" ============================
" # PLUGINS
" ============================

call plug#begin('~/.config/nvim/plugged')

" # UI
Plug 'sainnhe/sonokai'
Plug 'ap/vim-css-color'

" # Langs
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'

call plug#end()

" ============================
" # COLORSCHEME
" ============================

if has('termguicolors')
    set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
" 
" let g:lightline = { 'colorscheme': 'sonokai', }

" ============================
" # EDITOR SETTINGS
" ============================

" set laststatus=2
" set noshowmode

" set tabstop=8 
" set softtabstop=0
" set expandtab 
" set shiftwidth=4 
" set smarttab
" 
" set number
" set path+=**					" Searches current directory recursively.
" set wildmenu					" Display all matches when tab complete.
" set incsearch                   " Incremental search
" set hidden                      " Needed to keep multiple buffers open
" set nobackup                    " No auto backups
" set noswapfile                  " No swap
" set t_Co=256                    " Set if term supports 256 colors.
" set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
" syntax enable
" let g:rehash256 = 1
" set mouse=nicr
" set mouse=a
set guifont=Monaco:h15
