function get_config(name)
	return string.format('require("configs/%s")', name)
end

return require("packer").startup({
	function(use)
		use({
			"wbthomason/packer.nvim",
			commit = "4dedd3b08f8c6e3f84afbce0c23b66320cd2a8f2",
		})
		use({
			"nvim-lua/plenary.nvim",
			commit = "0d660152000a40d52158c155625865da2aa7aa1b",
		})
		use({
			"sainnhe/everforest",
			commit = "764e36cf49a5845217ef09281adf708ab5abd9e3",
		})
		use({
			"max397574/better-escape.nvim",
			commit = "d2efbf0093235525e81f537f8f4e63f23acedf06",
			config = get_config("better-escape"), 
		})
		use({
			"kyazdani42/nvim-web-devicons",
			after = "everforest",
			commit = "09e62319974d7d7ec7e53b974724f7942470ef78",
		})
		use({
			"kyazdani42/nvim-tree.lua",
			commit = "2457e141ae5c2e9c5d94a9550b37b421d25cfff1",
			after = "nvim-web-devicons",
			config = get_config("tree"),
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			commit = "969f7aee253da4fa8a076c3e171546e76644bb70",
			run = ":TSUpdate",
			config = get_config("treesitter"),
		})
		use({
			"nvim-telescope/telescope.nvim",
			after = { "plenary.nvim", "nvim-treesitter" },
			commit = "cf2d6d34282afd90f0f5d2aba265a23b068494c2",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			after = "nvim-treesitter",
			commit = "045d9582094b27f5ae04d8b635c6da8e97e53f1d",
			config = get_config("indent-blankline"),
		})
		use({
			"tpope/vim-sleuth",
			commit = "e116c2cc2555b09aee9b18eba405b925c8b7eaf9",
		})
		use({
			"lewis6991/gitsigns.nvim",
			commit = "0c7da98aab9c40515f24acba2a4feb85a60dd2a5",
			config = get_config("gitsigns"),
		})
		use({
			"nvim-lualine/lualine.nvim",
			commit = "18a07f790ed7ed1f11d1b130c02782e9dfd8dd7d",
			after = { "nvim-web-devicons", "everforest" },
			config = get_config("lualine"),
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
