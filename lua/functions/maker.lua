local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Open zathura to view pdf
keymap('n', '<F1>', ':!zathura %:r.pdf & disown<CR>', opts)
keymap('i', '<F1>', '<Esc>:!zathura %:r.pdf & disown<CR>', opts)
keymap('v', '<F1>', '<Esc>:!zathura %:r.pdf & disown<CR>', opts)

-- Call makers program to make makefile
keymap('n', '<F2>', ':ter makers -d %:p:h %:t<CR>', opts)
keymap('i', '<F2>', '<Esc>:ter makers -d %:p:h %:t<CR>', opts)
keymap('v', '<F2>', '<Esc>:ter makers -d %:p:h %:t<CR>', opts)

-- Add compilation via Make commands
keymap('n', '<F4>', ':make clean -C %:p:h<CR><CR>', opts)
keymap('i', '<F4>', '<Esc>:make clean -C %:p:h<CR>', opts)
keymap('v', '<F4>', '<Esc>:make clean -C %:p:h<CR>', opts)

keymap('n', '<F5>', ':make -C %:p:h<CR><CR>', opts)
keymap('i', '<F5>', '<Esc>:make -C %:p:h<CR>', opts)
keymap('v', '<F5>', '<Esc>:make -C %:p:h<CR>', opts)

