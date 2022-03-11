function get_config(name)
	return string.format('require("configs/%s")', name)
end

return require('packer').startup({
	function(use)
		use('wbthomason/packer.nvim')
		use('sainnhe/everforest')
		use({ 'max397574/better-escape.nvim', config = get_config("better-escape") })
		use({
			'kyazdani42/nvim-tree.lua',
			commit = "2457e141ae5c2e9c5d94a9550b37b421d25cfff1",
			requires = {
				'kyazdani42/nvim-web-devicons',
			},
			config = get_config('tree'),
		})

	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
