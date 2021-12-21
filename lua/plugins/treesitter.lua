require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'python',
		'lua',
		'c',
		'cpp',
		'bash',
		'markdown',
		'latex',
		'make',
		'cmake',
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
}

vim.o.foldlevel = 20
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
