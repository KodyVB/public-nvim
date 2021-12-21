vim.api.nvim_set_keymap('n', '<Leader>co', ':lua require("Comment.api").gco()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cO', ':lua require("Comment.api").gcO()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ca', ':lua require("Comment.api").gcA()<CR>', { noremap = true, silent = true })

require('Comment').setup({
	--LHS of toggle mappings in NORMAL + VISUAL mode
	--@type table
	toggler = {
		--line-comment keymap
		line = ';cc',
		--block-comment keymap
		block = ';cb',
	},

	--LHS of operator-pending mappings in NORMAL + VISUAL mode
	--@type table
	opleader = {
		--line-comment keymap
		line = ';c',
		--block-comment keymap
		block = ';bc',
	},
})

