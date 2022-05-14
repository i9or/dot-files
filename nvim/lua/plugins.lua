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
			after = { "plenary.nvim", "nvim-treesitter" },
			commit = "39b12d84e86f5054e2ed98829b367598ae53ab41",
			cmd = "Telescope",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			after = "nvim-treesitter",
			commit = "8567ac8ccd19ee41a6ec55bf044884799fa3f56b",
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
			"neovim/nvim-lspconfig",
			commit = "9ff2a06cebd4c8c3af5259d713959ab310125bec",
			after = { "nvim-cmp", "cmp-nvim-lsp", "cmp_luasnip", "LuaSnip", "fidget.nvim" },
			config = get_config("lspconfig"),
		})
		use({
			"cdelledonne/vim-cmake",
			commit = "07fb73ee0d0c89dd608f1ed5f691bc151406558",
		})
		use({
			"hrsh7th/nvim-cmp",
			commit = "9a0c639ac2324e6e9ecc54dc22b1d32bb6c42ab9",
		})
		use({
			"hrsh7th/cmp-nvim-lsp",
			commit = "e6b5feb2e6560b61f31c756fb9231a0d7b10c73d",
		})
		use({
			"saadparwaiz1/cmp_luasnip",
			commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
		})
		use({
			"L3MON4D3/LuaSnip",
			commit = "cc0086390c6cd2eaebae1834b115c891649ec95f",
		})
		use({
			"j-hui/fidget.nvim",
			commit = "99b306167d1d305ca084e3bb475d6eadf32a365b",
			config = get_config("fidget"),
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
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
