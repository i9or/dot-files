function get_config(name)
	return string.format('require("configs/%s")', name)
end

return require("packer").startup({
	function(use)
		use({
			"wbthomason/packer.nvim",
		})
		use({
			"nvim-lua/plenary.nvim",
		})
		use({
			"sainnhe/everforest",
		})
		use({
			"max397574/better-escape.nvim",
			event = "InsertCharPre",
			config = get_config("better-escape"), 
		})
		use({
			"kyazdani42/nvim-tree.lua",
			config = get_config("tree"),
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = { "BufRead", "BufNewFile" },
			cmd = {
				"TSInstall",
				"TSInstallInfo",
				"TSInstallSync",
				"TSUninstall",
				"TSUpdate",
				"TSUpdateSync",
				"TSDisableAll",
				"TSEnableAll",
			},
			config = get_config("treesitter"),
		})
		use({
			"nvim-telescope/telescope.nvim",
			after = { "plenary.nvim", "nvim-treesitter" },
			cmd = "Telescope",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			after = "nvim-treesitter",
			event = "BufRead",
			config = get_config("indent-blankline"),
		})
		use({
			"tpope/vim-sleuth",
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = get_config("gitsigns"),
		})
		use({
			"nvim-lualine/lualine.nvim",
			after = { "everforest" },
			config = get_config("lualine"),
		})
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.1.0",
			after = { "nvim-tree.lua" },
			config = get_config("bufferline"),
		})
		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = get_config("autopairs"),
		})
		use({
			"tpope/vim-surround",
		})
		use({
			"b3nj5m1n/kommentary",
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
