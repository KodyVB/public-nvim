vim.api.nvim_set_keymap('v', '<leader>f', ':lua Table_clean()<CR>', { noremap = true, silent = true })

function Table_clean()
	local separator = vim.fn.input('Enter table separator: ')
	if (separator == '') then
		separator = '&'
	end
	vim.cmd(":'<,'>!column -t -s \"" .. separator .. "\" -o \"" .. separator .. "\"")
end

