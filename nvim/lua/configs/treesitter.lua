local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

ts_config.setup({
	ensure_installed = {
		"lua",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"dockerfile",
		"eex",
		"elixir",
		"glsl",
		"go",
		"gomod",
		"gowork",
		"graphql",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"make",
		"python",
		"tsx",
		"typescript",
		"zig",
	},
	highlight = {
		enabled = true,
		use_languagetree = true,
	},
})
