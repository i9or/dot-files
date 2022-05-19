vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.wo.signcolumn = "yes"

vim.opt.scrolloff = 3
vim.opt.autowrite = true
vim.opt.mousehide = true
vim.opt.hidden = true
vim.opt.showmatch = true
vim.opt.matchtime = 5

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.cursorline = true

vim.opt.mouse = "a"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.o.completeopt = "menuone,noselect"

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g["everforest_background"] = "hard"
vim.cmd("colorscheme everforest")

vim.cmd("highlight clear SignColumn")

-- Language specific options
-- C
vim.g["c_syntax_for_h"] = true

-- CMake
vim.g["cmake_link_compile_commands"] = 1
vim.g["cmake_build_dir_location"] = "./build"
