vim.cmd([[
nnoremap <silent><expr> <Leader>m  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <Leader>mr :MagmaEvaluateLine<CR>
xnoremap <silent>       <Leader>m  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <Leader>mc :MagmaReevaluateCell<CR>
nnoremap <silent>       <Leader>md :MagmaDelete<CR>
nnoremap <silent>       <Leader>mo :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
]])
