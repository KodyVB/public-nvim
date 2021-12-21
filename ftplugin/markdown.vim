set iskeyword+=:

" Syntax for latex and md
set conceallevel=2
let g:tex_conceal="abdmg"

set relativenumber
" inoremap <buffer> <Leader><Leader> <Esc>/<++><CR>"_c4l

" Open zathura to view pdf
" function! Open_zathura()
	" let fname = expand("%:r")
	" execute "!zathura " . fname . ".pdf & disown"
" endfunction
" inoremap <buffer> <F1> <Esc>:call Open_zathura()<CR>a
" nnoremap <buffer> <F1> :call Open_zathura()<CR>

" Compile document using pandoc:
" function! Md_compile()
	" let fname = expand("%:r")
	" let date = substitute(system("date +%D"), '\n', '', 'g')
	" execute "!pandoc --filter pandoc-crossref --filter pandoc-citeproc --metadata date=\"" . date . "\" -N " . fname . ".md -o " . fname . ".pdf"
" endfunction
" inoremap <buffer> <F5> <Esc>:call Md_compile()<CR>a
" nnoremap <buffer> <F5> :call Md_compile()<CR>

" Compile document using pandoc for beamer:
" function! Md_compile_beamer()
	" let fname = expand("%:r")
	" let date = substitute(system("date +%D"), '\n', '', 'g')
	" execute "!pandoc -t beamer --filter pandoc-crossref --filter pandoc-citeproc --metadata date=\"" . date . "\" -N " . fname . ".md -o " . fname . ".pdf"
" endfunction
" inoremap <buffer> <F4> <Esc>:call Md_compile_beamer()<CR>a
" nnoremap <buffer> <F4> :call Md_compile_beamer()<CR>

" source ~/.config/nvim/sources/greekLetters.vim
lua require('greek_letters')

