local present, alpha = pcall(require, "alpha")

if not present then
	return
end

local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
	[[⠀⠀⣀⣴⣷⣄⣀⣾⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣾⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[ ⠀⠀⠈⢻⣿⡇⠉⠙⣿⣿⠁⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⡀⠀⠀⠀⡈⠀⠀⠀⢀⠀⠀⢀⡀⠀⠀⠀⡀⠀⠀⠀]],
	[[ ⠀⠀⠀⢸⣿⡇⠀⠀⣿⣿⠀⠀⠀⠀⣠⢾⣿⣷⣶⡤⠀⠀⢀⡠⢿⣿⣷⣦⠄⢠⣿⣷⡆⠀⣼⣿⣶⠀⣾⣿⣶⠀⠰⣿⣷⡴⣿⣿⣷⣦⢾⣿⣿⣶⠄]],
	[[  ⠀⠀⢸⣿⡇⠀⠀⣿⣿⠀⠀⠀⣿⣿⠀⠀⣹⠟⠃⠀⢸⣿⡇⠀⠈⣿⣿⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⣿⣿⠀]],
	[[⠀⠀⠀⠀⢸⣿⡇⠀⠀⣿⣿⠀⠀⢀⣿⣿⢀⠴⠁⠀⠀⠀⢸⣿⡇⠀⠀⣿⣿⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⣿⣿⡀]],
	[[⠀⠀⠀⠀⢹⣿⡇⠀⠀⣿⣿⠉⠀⠈⣿⣿⠁⠀⠀⠀⢀⠀⢹⣿⡇⠀⠀⣿⣿⠁⠀⣿⣿⡇⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⣿⣿⠁]],
	[[⠀⠀⠀⠀⢸⣿⡇⠀⠀⣿⣿⠀⠀⠀⣿⣿⠀⠀⣀⣴⡇⠀⢸⣿⡇⠀⠀⣿⣿⠀⠠⢿⣿⣷⡀⢸⣿⣿⠀⢸⣿⣿⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⣿⣿⠀]],
	[[⠀⠀⠀⠀⢸⣿⡇⠀⢀⣿⣿⡤⠀⣀⣿⣿⣦⣤⡼⠛⠃⠀⣸⣿⣷⣦⣤⠿⠛⠀⠀⠀⠙⢿⣿⣼⠿⠛⠀⢸⣿⣿⡠⠀⣿⣿⣇⠄⢸⣿⣿⡀⠀⣿⣿⠀]],
	[[⠀⠀⠀⠀⢸⣿⠷⠄⠀⠙⠋⠀⠀⠀⠈⠉⠛⠋⠀⠀⠀⠀⠀⠈⠙⠛⠃⠀⠀⠀⠀⠀⠀⠈⠻⠁⠀⠀⠀⠀⠙⠋⠀⠀⠈⠛⠁⠀⠀⠙⠃⠀⢀⣿⠏⠀]],
	[[⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀]],
	[[⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
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

alpha.setup(dashboard.config)
