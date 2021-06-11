colorscheme molokai
set laststatus=2
set noshowmode
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
"set number relativenumber       " Display line numbers
"set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1
"set mouse=nicr
"set mouse=a
set guifont=Monaco:h15


let g:python3_host_prog="/usr/bin/python"

call plug#begin('~/.config/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-racer'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'ziglang/zig.vim'
call plug#end()

" rust-land
let g:autofmt_autosave = 1

"LanguageCloent-neovim
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'zig': ['~/Side/zls/zls'],
    \ }
nmap <F5> <Plug>(lcn-menu)

" ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

"NerdTree
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
