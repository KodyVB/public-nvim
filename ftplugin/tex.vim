set iskeyword+=:

" Syntax for latex and md
set conceallevel=2
let g:tex_conceal="abdmg"

set relativenumber
" inoremap <buffer> <Leader><Leader> <Esc>/<++><CR>"_c4l

" Compile document using pdflatex:
" inoremap <buffer> <F5> <Esc>:!pdflatex<space><c-r>%<CR>a
" nnoremap <buffer> <F5> :!pdflatex<space><c-r>%<CR>

" Compile document using pdflatex and biber:
" function! Biber_compile()
	" let fname = expand("%:r")
	" let ename = expand("%")
	" execute "!pdflatex " . ename
	" execute "!biber " . fname
	" execute "!pdflatex " . ename
" endfunction
" inoremap <buffer> <F4> <Esc>:call Biber_compile()<CR>a
" nnoremap <buffer> <F4> :call Biber_compile()<CR>

" source ~/.config/nvim/sources/greekLetters.vim
lua require('greek_letters')

