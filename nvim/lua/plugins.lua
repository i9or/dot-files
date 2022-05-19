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
			commit = "0a907364b5cd6e3438e230df7add8b9bb5ef6fd3",
		})
		use({
			"sainnhe/everforest",
			commit = "f748681a3fac2496aedf694f5bd09a30f80cd3c0",
		})
		use({
			"max397574/better-escape.nvim",
			commit = "d5ee0cef56a7e41a86048c14f25e964876ac20c1",
			event = "InsertCharPre",
			config = get_config("better-escape"), 
		})
		use({
			"kyazdani42/nvim-web-devicons",
			after = "everforest",
			commit = "53dc7b388ba84a14e40a6ab2d4c22972d81292ad",
		})
		use({
			"kyazdani42/nvim-tree.lua",
			commit = "aefa66c04d2b10cdb356679dbba5952b00116808",
			after = "nvim-web-devicons",
			config = get_config("tree"),
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			commit = "b30a830c88490b742cb9791025aa68589f1bba34",
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
			commit = "39b12d84e86f5054e2ed98829b367598ae53ab41",
			after = { "plenary.nvim", "nvim-treesitter" },
			cmd = "Telescope",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			commit = "8567ac8ccd19ee41a6ec55bf044884799fa3f56b",
			after = "nvim-treesitter",
			event = "BufRead",
			config = get_config("indent-blankline"),
		})
		use({
			"tpope/vim-sleuth",
			commit = "1d25e8e5dc4062e38cab1a461934ee5e9d59e5a8",
		})
		use({
			"lewis6991/gitsigns.nvim",
			commit = "ffd06e36f6067935d8cb9793905dd2e84e291310",
			config = get_config("gitsigns"),
		})
		use({
			"nvim-lualine/lualine.nvim",
			commit = "18a07f790ed7ed1f11d1b130c02782e9dfd8dd7d",
			after = { "nvim-web-devicons", "everforest" },
			config = get_config("lualine"),
		})
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.1.0",
			after = { "nvim-web-devicons", "nvim-tree.lua" },
			config = get_config("bufferline"),
		})
		use({
			"cdelledonne/vim-cmake",
			commit = "07fb73ee0d0c89dd608f1ed5f691bc151406558",
		})
		use({
			"windwp/nvim-autopairs",
			commit = "aea913109d30c87df329ec9b8fea9aed6ef9f52a",
			event = "InsertEnter",
			config = get_config("autopairs"),
		})
		use({
			"goolord/alpha-nvim",
			commit = "4781fcfea5ddc1a92d41b32dc325132ed6fce7a8",
			config = get_config("alpha"),
		})
		use({
			"elixir-editors/vim-elixir",
			commit = "edf880c41ec1768faafc480433ae72ceffaf4362",
		})
		use({
			"tpope/vim-surround",
			commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea",
		})
		use({
			"b3nj5m1n/kommentary",
			commit = "12ecde4ed3ecb39964000a5fd034ae4c1d307388",
		})
		use({
			"Olical/conjure",
			commit = "868e66e1a962ba078931bc01333d82f2a3f5845f",
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
