local wk = require('which-key')

wk.setup {
	triggers_blacklist = {
		i = { ';' },
	},

	wk.register({
		b = 'Buffers',
		d = 'Delete (CB)',
		l = 'Local list',
		n = 'Next (LL)',
		p = 'Prev (LL)',
		q = 'Quickfix list',
		r = 'Resize mode',
		y = 'Yank (CB)',
		f = {
			name = 'Find',
			b = 'Buffers',
			d = 'Directory .',
			D = 'Directory ~',
			e = 'Explorer .',
			E = 'Explorer ~',
			f = 'File .',
			F = 'File ~',
			g = 'Git',
			l = 'Local list',
			q = 'Quickfix list',
			r = 'Grep',
			s = 'Sessions',
		},
		t = {
			name = 'Tabs',
			d = 'Tab delete',
			['1'] = 'Go to 1',
			['2'] = 'Go to 2',
			['3'] = 'Go to 3',
			['4'] = 'Go to 4',
			['5'] = 'Go to 5',
			['6'] = 'Go to 6',
			['7'] = 'Go to 7',
			['8'] = 'Go to 8',
			['9'] = 'Go to 9',
		},
		c = {
			name = 'Comment',
			a = 'Comment append',
			c = 'Comment line',
			b = 'Comment block',
			d = 'Change directory',
			o = 'Comment below',
			O = 'Comment above',
		},
		g = {
			name = 'Code',
			c = 'Completion toggle',
			d = 'Definition',
			h = 'Hover',
			n = 'Rename',
			r = 'References',
		},
	}, { prefix = '<Leader>' }),

	wk.register({
		d = 'Delete (CB)',
		f = 'Format table',
		y = 'Yank (CB)',
		c = {
			c = 'Comment line',
			b = 'Comment block',
		},
	}, {
		mode = 'v',
		prefix = '<Leader>',
	}),
}
