local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- macOS forward delete
map("i", "<C-d>", "<Del>", opts)

-- Space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Mappings for nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)
map("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", opts)

-- Mappings for telescope.nvim
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)

-- Mappings for vim-cmake
map("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", opts)
map("n", "<leader>cb", "<cmd>CMakeBuild<CR>", opts)
map("n", "<leader>cq", "<cmd>CMakeClose<CR>", opts)
