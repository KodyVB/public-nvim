return require('packer').startup({function(use)
	-- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' } -- jupyter notebook
    use { 'wbthomason/packer.nvim' }

    use { 'jremmen/vim-ripgrep' }

    use { 'vim-pandoc/vim-pandoc-syntax' }

    -- use { 'dracula/vim', { 'as': 'dracula' } }
    -- use { 'arcticicestudio/nord-vim' }
    -- use { 'joshdick/onedark.vim' }
    -- use { 'morhetz/gruvbox' }
    -- use { 'sonph/onehalf', { 'rtp': 'vim/' } }
    use { 'tomasiser/vim-code-dark' }
    use { 'nvim-lualine/lualine.nvim',
	requires = {
	    'kyazdani42/nvim-web-devicons' 
	}}

    use { 'chrisbra/Colorizer' }
    use { 'numToStr/Comment.nvim' }
    use { 'tpope/vim-surround' }
    use { 'unblevable/quick-scope' }
    use { 'xuhdev/vim-latex-live-preview', ft = 'tex' }

    use { 'hrsh7th/nvim-cmp',
	requires = {
	    'saadparwaiz1/cmp_luasnip',
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	}}

    use { 'L3MON4D3/LuaSnip' }
    use { 'neovim/nvim-lspconfig',
	requires = {
		'williamboman/nvim-lsp-installer'
	}}

    use { 'windwp/nvim-autopairs' }

    use { 'onsails/lspkind-nvim' }

    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    use { 'nvim-telescope/telescope.nvim',
	requires = {
	    'nvim-telescope/telescope-fzf-native.nvim'
	}}

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'milkypostman/vim-togglelist' }

    use { 'folke/which-key.nvim' }

    use { 'cdelledonne/vim-cmake' }

    use { 'Shatur/neovim-session-manager' }

end,
    config = {
	display = {
	    open_fn = function()
		return require('packer.util').float({ border = 'single' })
	    end
	},
	profile = {
	    enable = true,
	    threshold = 0,
	}
    }
})
