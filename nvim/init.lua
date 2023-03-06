local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Disable netrw for nvim-tree.lua plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Space as a leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- ============================================================================
-- Plugins section
-- ============================================================================
-- ============================================================================
-- Lazy plugin manager
require("lazy").setup({
	"nvim-lua/plenary.nvim",

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			require("nightfox").setup({
				options = {
					transparent = true,
					styles = {
						comments = "italic"
					},
					inverse = {
						match_paren = true,
						visual = true,
					},
				},
			})
			vim.cmd([[colorscheme nightfox]])
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function ()
			require("nvim-autopairs").setup({})
		end,
	},

	"b3nj5m1n/kommentary",

	"tpope/vim-sleuth",

	"nvim-tree/nvim-web-devicons",

	{
		"nvim-tree/nvim-tree.lua",
		config = function ()
			require("nvim-tree").setup({
				disable_netrw = true,
				hijack_cursor = true,
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
				},
				view = {
					hide_root_folder = true,
				},
				git = {
					enable = false,
					ignore = false,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
					icons = {
						show = {
							git = false,
						},
					},
				},
			})
		end,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertCharPre",
		config = function ()
			require("better_escape").setup({})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
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
		config = function ()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					-- LuaFormatter off
					"bash",
					"c",
					"cmake",
					"comment",
					"cpp",
					"css",
					"dockerfile",
					"gitattributes",
					"gitignore",
					"glsl",
					"go",
					"gomod",
					"gowork",
					"graphql",
					"html",
					"ini",
					"javascript",
					"jsdoc",
					"json",
					"json5",
					"lua",
					"make",
					"markdown",
					"prisma",
					"proto",
					"python",
					"regex",
					"ruby",
					"scheme",
					"scss",
					"sql",
					"svelte",
					"tsx",
					"typescript",
					"yaml"
					-- LuaFormatter on
				},
				highlight = {
					enabled = true,
					use_languagetree = true,
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function ()
			require("indent_blankline").setup({
				indentLine_enabled = 1,
				filetype_exclude = {
					"help",
					"terminal",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
					"lsp-installer",
					"",
				},
				buftype_exclude = { "terminal" },
				show_trailing_blankline_indent = false,
				show_first_indent_level = false,
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},

	"tpope/vim-surround",

	{
		"nvim-lualine/lualine.nvim",
		config = function ()
			require("lualine").setup({
				options = {
					disabled_filetypes = {
						statusline = {
							"dashboard",
							"alpha",
							"NvimTree",
						},
					},
				},
			})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		tag = "v3.1.0",
		config = function ()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
							padding = 1,
						},
					},
				},
			})
		end,
	},

	{
		"goolord/alpha-nvim",
		config = function ()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[╔═════════════╗]],
				[[║ N e o V i m ║]],
				[[╚═════════════╝]],
			}

			dashboard.section.buttons.val = {
				dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
				dashboard.button( "SPC f f", "  Find file"),
				dashboard.button( "SPC f g", "  Find word"),
				dashboard.button( "CTRL n", "  Open File Explorer", ":NvimTreeToggle<CR>"),
				dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
			}

			dashboard.config.opts.noautocmd = true
			vim.cmd[[autocmd User AlphaReady echo 'ready']]

			require("alpha").setup(dashboard.config)
		end,
	},

	"ntpeters/vim-better-whitespace",
})

-- ============================================================================
-- ============================================================================
-- Rest of the mappings
-- ============================================================================
-- ============================================================================
-- Escape terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Search result no highlight
keymap("n", "<leader>ss", "<cmd>nohlsearch<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual mode indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Treat long lines as break lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)

-- Mappings for nvim-tree.lua
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", opts)

-- Mappings for telescope.nvim
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)

-- Mappings for bufferline.nvim
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- ============================================================================
-- ============================================================================
-- Rest of the options
-- ============================================================================
-- ============================================================================
vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.wo.signcolumn = "yes"

vim.opt.scrolloff = 3
vim.opt.mousehide = true
vim.opt.showmatch = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.showmode = false

vim.opt.mouse = "a"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.o.completeopt = "menuone,noselect"

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd("highlight clear SignColumn")

-- Language specific options
-- C
vim.g["c_syntax_for_h"] = true
