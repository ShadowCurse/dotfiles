" ============================
" # PLUGINS
" ============================

call plug#begin('~/.config/nvim/plugged')

" # UI
Plug 'sainnhe/sonokai'
Plug 'ap/vim-css-color'

" # Langs
Plug 'rust-lang/rust.vim'
Plug 'tomlion/vim-solidity'
Plug 'ziglang/zig.vim'
Plug 'neovimhaskell/haskell-vim'
" Plug 'alx741/vim-hindent'

" # Other
Plug 'sbdchd/neoformat'

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
" colorscheme sonokai
" 
" let g:lightline = { 'colorscheme': 'sonokai', }

" ============================
" # EDITOR SETTINGS
" ============================
set guifont=Monaco:h15
