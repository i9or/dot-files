local present, lualine = pcall(require, "lualine")

if not present then
	return
end

lualine.setup({
	options = {
		theme = "everforest",
		disabled_filetypes = {
			"dashboard",
			"startify",
			"NvimTree",
			"packer",
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 1 },
		},
		lualine_x = {
			"diff",
			"encoding",
			"fileformat",
		},
		lualine_y = { "filetype" },
		lualine_z = {
			{ "progress", padding = { right = 0 }, separator = "" },
			{ "location", padding = { left = 0 } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
