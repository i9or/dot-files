function get_config(name)
	return string.format('require("configs/%s")', name)
end

return require('packer').startup({
	function(use)
		use({
			'wbthomason/packer.nvim',
			commit = '4dedd3b08f8c6e3f84afbce0c23b66320cd2a8f2',
		})
		use({
			'sainnhe/everforest',
			commit = '764e36cf49a5845217ef09281adf708ab5abd9e3',
		})
		use({
			'max397574/better-escape.nvim',
			commit = 'd2efbf0093235525e81f537f8f4e63f23acedf06',
			config = get_config('better-escape'), 
		})
		use({
			'kyazdani42/nvim-web-devicons',
			after = 'everforest',
			commit = '09e62319974d7d7ec7e53b974724f7942470ef78',
		})
		use({
			'kyazdani42/nvim-tree.lua',
			commit = '2457e141ae5c2e9c5d94a9550b37b421d25cfff1',
			after = 'nvim-web-devicons',
			config = get_config('tree'),
		})
		use({
			'fatih/vim-go',
			commit = 'dcefd64ba251ffc3d497f8758036735c8f6cc824',
		})
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		},
	},
})
