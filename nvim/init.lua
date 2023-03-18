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
-- Helpers
-- ============================================================================
-- ============================================================================

local function lsp_client()
	local buf_clients = vim.lsp.buf_get_clients()
	if next(buf_clients) == nil then
		return ""
	end

	return " "
end

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
--						match_paren = true,
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
					"dockerfile",
					"gitattributes",
					"gitignore",
					"glsl",
					"graphql",
					"html",
					"ini",
					"javascript",
					"json",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"prisma",
					"python",
					"regex",
					"ruby",
					"scss",
					"sql",
					"tsx",
					"typescript",
					"yaml",
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
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						"diff",
					},
					lualine_c = {
						{ "filename", path = 1 },
						{ "diagnostics", sources = { "nvim_lsp" } },
					},
					lualine_x = {
						{ lsp_client },
						"encoding",
						"fileformat",
					},
					lualine_y = { "filetype" },
					lualine_z = {
						{ "progress", padding = { right = 0 }, separator = "" },
						{ "location", padding = { left = 0 } },
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

	{
		"j-hui/fidget.nvim",
		config = function ()
			require("fidget").setup({})
		end
	},

	{
		"L3MON4D3/LuaSnip",
		version = "1.*",
	},

	"saadparwaiz1/cmp_luasnip",

	"hrsh7th/nvim-cmp",

	"hrsh7th/cmp-nvim-lsp",

	{
		"neovim/nvim-lspconfig",
		config = function ()
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

			local on_attach = function (client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>=", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			end

			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = ""
			}

			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function (args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					format = function (entry, vim_item)
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
						})[entry.source.name]

						return vim_item
					end
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function (fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function (fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				completion = {
					autocomplete = false,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				},
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("lspconfig")["clangd"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},

	"cdelledonne/vim-cmake",

	"tpope/vim-rails",
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
--[[ keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts) ]]

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

-- Mappings for vim-cmake
keymap("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", opts)
keymap("n", "<leader>cb", "<cmd>CMakeBuild<CR>", opts)
keymap("n", "<leader>cq", "<cmd>CMakeClose<CR>", opts)

-- ============================================================================
-- ============================================================================
-- Rest of the options
-- ============================================================================
-- ============================================================================
vim.opt.colorcolumn = "80"

-- Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable both absolute and relative line numbers (rnu stands for "relative number and number")
vim.opt.nu = true
vim.opt.rnu = true

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

-- CMake
vim.g["cmake_link_compile_commands"] = 1
vim.g["cmake_build_dir_location"] = "./build"
