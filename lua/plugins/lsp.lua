-- Lsp related keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', '<Leader>gc', ':lua Cmp_Toggler()<CR>', opts)
keymap('n', '<Leader>gd', ':lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', '<Leader>gr', ':lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<Leader>gh', ':lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<Leader>gn', ':lua vim.lsp.buf.rename()<CR>', opts)
