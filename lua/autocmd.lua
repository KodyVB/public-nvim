vim.cmd [[
" Allow pandoc syntax to work without pandoc plugin

augroup autocomplete
	autocmd! BufNewFile,BufFilePre,BufRead *.py,*.cpp,*.c,*.md,*.tex :lua vim.g.cmp_enabled=true
augroup END

augroup pandoc_syntax
	autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

augroup LSP
	autocmd! BufWrite,BufEnter,InsertLeave * :lua vim.diagnostic.setloclist({open = false})
augroup END
]]
