vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.tabstop = 2

-- Basic Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('dot-files-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
-- To check the current status of plugins:
-- 	:Lazy
-- To update plugins:
-- 	:Lazy update
require('lazy').setup({
	'tpope/vim-sleuth',

	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},

	{
		'nvim-telescope/telescope.nvim',
		event = 'VimEnter',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
		},
		config = function()
			require('telescope').setup {
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown(),
					},
				},
			}

			pcall(require('telescope').load_extension, 'ui-select')

			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
			vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
			
			vim.keymap.set('n', '<leader>/', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer' })

			vim.keymap.set('n', '<leader>s/', function()
				builtin.live_grep {
					grep_open_files = true,
					prompt_title = 'Live Grep in Open Files',
				}
			end, { desc = '[S]earch [/] in Open Files' })

			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = '[S]earch [N]eovim files' })
		end,
	},

	{
		'folke/tokyonight.nvim',
		priority = 1000,
		config = function()
			require('tokyonight').setup {
				styles = {
					comments = { italic = false },
				},
			}

			vim.cmd.colorscheme 'tokyonight-night'
		end,
	},

	{
		'ggandor/leap.nvim',
		dependencies = {
			'tpope/vim-repeat'
		},
		config = function()
			-- require('leap').create_default_mappings()
			vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
			vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
			vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
		end,
	},

	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		opts = {
			signs = false
		},
	},

	{
		'echasnovski/mini.nvim',
		config = function()
			require('mini.pairs').setup()
			require('mini.comment').setup()
			require('mini.cursorword').setup()

			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = vim.g.have_nerd_font }
			statusline.section_location = function()
				return '%2l:%-2v'
			end
		end,
	},

	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
		config = function()
			require('ibl').setup()
		end,
	},

	{
		'max397574/better-escape.nvim',
		event = 'InsertCharPre',
		config = function()
			require('better_escape').setup({})
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs',
		opts = {
			ensure_installed = {
				'c',
				'cmake',
				'cpp',
				'diff',
				'gitattributes',
				'gitignore',
				'glsl',
				'go',
				'html',
				'ini',
				'json',
				'lua',
				'luadoc',
				'make',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'regex',
				'sql',
				'vim',
				'vimdoc',
				'yaml',
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = { enable = true, disable = { 'ruby' } },
		},
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '🛠',
			event = '📅',
			ft = '📂',
			init = '⚙',
			keys = '🗝',
			plugin = '🔌',
			runtime = '💻',
			require = '🌙',
			source = '📄',
			start = '🚀',
			task = '📌',
			lazy = '💤 ',
		},
	},
})

-- Language specific options
-- C
vim.g["c_syntax_for_h"] = true
