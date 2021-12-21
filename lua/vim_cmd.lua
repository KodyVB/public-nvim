vim.cmd [[
syntax on
filetype plugin indent on
set guicursor=
" set shiftwidth=4

" Add jumps bigger than 5 to jumplist
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

inoremap <expr> <Esc> pumvisible() ? "\\<C-e>" : "\\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\\<C-n>" : "\\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\\<C-p>" : "\\<Up>"

" Terminal opening options
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
command! -nargs=* TT tabnew | terminal <args>
autocmd TermOpen * startinsert
]]
