local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- macOS forward delete
map("i", "<C-d>", "<Del>", opts)

-- Space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Escape Terminal
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Search result no highlight
map("n", "<leader>sc", "<cmd>nohlsearch<CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Treat long lines as break lines
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("v", "j", "gj", opts)
map("v", "k", "gk", opts)

-- Mappings for nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)
map("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", opts)

-- Mappings for telescope.nvim
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
