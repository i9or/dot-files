vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.wo.signcolumn = "yes"

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.o.completeopt = "menuone,noselect"

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g["everforest_background"] = "hard"
vim.cmd("colorscheme everforest")

-- Language specific options
-- C
vim.g["c_syntax_for_h"] = true

-- CMake
vim.g["cmake_link_compile_commands"] = 1
vim.g["cmake_build_dir_location"] = "./build"
