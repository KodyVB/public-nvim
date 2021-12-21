-- vim.api.nvim_set_option('incsearch', true)
local options = {
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	ignorecase = true,
	smartcase = true,
	termguicolors = true,
	splitbelow = true,
	splitright = true,
	autoindent = true,
	number = true,
	hlsearch = false,
	completeopt = {'menuone', 'noselect'},
	wildmenu = true,
	wildignorecase = true,
	wildignore = '*.pyc,**/.cache*,**/.git/*,*.tar*',
	path = '.,**',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.api.nvim_set_var('completion_matching_strategy_list', { 'exact', 'substring', 'fuzzy' })

