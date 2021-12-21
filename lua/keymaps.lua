local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.api.nvim_set_var('mapleader', ';')

-- Insert mode ctrl navigation
keymap('i', '<C-h>', '<Left>', opts)
keymap('i', '<C-l>', '<Right>', opts)

-- Remap <Leader>j to escape key
keymap('n', '<Leader>j', '<Esc>', opts)
keymap('v', '<Leader>j', '<Esc>', opts)
keymap('i', '<Leader>j', '<Esc>', opts)
keymap('t', '<Leader>j', '<C-\\><C-n>', opts)

-- Change space bar to navigate forward after pressing f or t
keymap('n', '<SPACE>', ';', opts)
keymap('v', '<SPACE>', ';', opts)

-- Make window movment easier; use ctrl+vim movements.
-- noremap false silent true
keymap('', '<C-j>', '<C-w>j', opts)
keymap('', '<C-k>', '<C-w>k', opts)
keymap('', '<C-l>', '<C-w>l', opts)
keymap('', '<C-h>', '<C-w>h', opts)

-- Fixes arrow key navigation in insert mode
keymap('i', '<ESC>OA', '<UP>', opts)
keymap('i', '<ESC>OB', '<DOWN>', opts)
keymap('i', '<ESC>OC', '<RIGHT>', opts)
keymap('i', '<ESC>OD', '<LEFT>', opts)

-- Local and quick fix list navigation
keymap('n', '<C-n>', ':cnext<CR>', opts)
keymap('n', '<C-p>', ':cprev<CR>', opts)
keymap('n', '<Leader>n', ':lnext<CR>', opts)
keymap('n', '<Leader>p', ':lprev<CR>', opts)
keymap('n', '<Leader>q', ':call ToggleQuickfixList()<CR>', opts)
keymap('n', '<Leader>l', ':call ToggleLocationList()<CR>', opts)

-- Center when navigating
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)

-- Make auto-tabbing possible with < and >.
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Make highlighted text movable
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Clipboard copy/delete functionality
keymap('n', '<leader>y', '"+y', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>d', '"+d', opts)
keymap('v', '<leader>d', '"+d', opts)

-- Change directory and buffer keymap
keymap('n', '<Leader>cd', ':cd %:p:h<CR>', opts)
keymap('n', '<Leader>b', ':buffers<CR>', opts)

-- Spellcheck
keymap('', '<F6>', ':setlocal spell! spelllang=en_us<CR>', opts)
