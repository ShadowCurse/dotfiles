" ============================
" # PLUGINS
" ============================

call plug#begin('~/.config/nvim/plugged')

" # UI
Plug 'sainnhe/sonokai'
" Plug 'romgrk/doom-one.vim'
" Plug 'sainnhe/everforest'
" Plug 'ayu-theme/ayu-vim'
" Plug 'drewtempelmeyer/palenight.vim'

" # Langs
" Plug 'rust-lang/rust.vim'
" Plug 'tomlion/vim-solidity'
" Plug 'ziglang/zig.vim'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'ray-x/go.nvim'
" Plug 'alx741/vim-hindent'
Plug 'Tetralux/odin.vim'

" # Other
Plug 'sbdchd/neoformat'

call plug#end()

" ============================
" # COLORSCHEME
" ============================

" v lang detection
augroup filetypedetect
  au! BufRead,BufNewFile *.v		setfiletype v
augroup END

if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
" let ayucolor="mirage"   " for dark version of theme

colorscheme sonokai
" colorscheme ayu
" 
" let g:lightline = { 'colorscheme': 'sonokai', }

" ============================
" # EDITOR SETTINGS
" ============================
set guifont=Monaco:h15
