local custom_codedark = require('lualine.themes.codedark')
local code_black = '#1E1E1E'

custom_codedark.normal.a.fg = code_black
custom_codedark.normal.c.bg = code_black
custom_codedark.visual.a.fg = code_black
custom_codedark.visual.b.bg = code_black
custom_codedark.insert.a.fg = code_black
custom_codedark.insert.c.bg = code_black
custom_codedark.replace.a.fg = code_black
custom_codedark.replace.c.bg = code_black

require('lualine').setup{
	options = {
		theme = custom_codedark
	},
	extensions = {
		'quickfix'
	},
	sections = {
		lualine_a = {
			{
			'filename',
			file_status = true,
			path = 1,
			shorting_target = 40
		}
		},
	},
	tabline = {
		lualine_a = { 'buffers' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { },
		lualine_y = { },
		lualine_z = { 'tabs' },
	}
}

