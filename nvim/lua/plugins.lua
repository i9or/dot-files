return require('packer').startup(function()
  use 'wbthomason/packer.nvim'                          
  use 'sainnhe/everforest'
  use {
	  "max397574/better-escape.nvim",
	  config = function()
		  require("better_escape").setup()
	  end,
  }
end)
