syntax on 
colorscheme molokai
execute pathogen#infect()
filetype plugin indent on
set laststatus=2
set noshowmode
map <C-t> :NERDTreeToggle<CR>
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
hi Normal guibg=NONE ctermbg=NONE
let g:ycm_confirm_extra_conf = 0
