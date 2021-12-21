-- Activate a 'resize mode' which is like i3's resize mode.
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Resize mode toggles
vim.g.resize_active = 0
keymap('n', '<Leader>r', ":lua require('functions.resize_mode').Switch_resize_keys()<CR>", { noremap = true, silent = true })
keymap('t', '<Leader>r', "<C-\\><C-n>:lua require('functions.resize_mode').Switch_resize_keys()<CR>", { noremap = true, silent = true })

local M = {}
M.Switch_resize_keys = function()
	if(vim.g.resize_active == 0)
	then
		vim.g.resize_active = 1
		-- Switch to resize keys
		keymap('n', 'h', '<C-w><', opts)
		keymap('n', 'j', '<C-w>-', opts)
		keymap('n', 'k', '<C-w>+', opts)
		keymap('n', 'l', '<C-w>>', opts)
		-- Switch to window moving keys
		keymap('n', 'H', '<C-w>H', opts)
		keymap('n', 'J', '<C-w>J', opts)
		keymap('n', 'K', '<C-w>K', opts)
		keymap('n', 'L', '<C-w>L', opts)
		keymap('n', '=', '<C-w>=', opts)
		keymap('n', '_', '<C-w>_', opts)
		keymap('n', '+', '<C-w><bar>', opts)
		-- Remap escape to escape mode
		keymap('n', '<esc>', ':call Switch_resize_keys()<CR>', opts)
		print('Resizing mode active')
	else
		vim.g.resize_active = 0
		-- Switch back to normal keys
		keymap('n', 'h', 'h', opts)
		keymap('n', 'j', 'j', opts)
		keymap('n', 'k', 'k', opts)
		keymap('n', 'l', 'l', opts)
		keymap('n', 'H', 'H', opts)
		keymap('n', 'J', 'J', opts)
		keymap('n', 'K', 'K', opts)
		keymap('n', 'L', 'L', opts)
		keymap('n', '=', '=', opts)
		keymap('n', '_', '_', opts)
		keymap('n', '+', '+', opts)
		keymap('n', '<esc>', '<esc>', opts)
		print('Normal mode active')
	end
end

return M
