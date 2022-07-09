local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

ts_config.setup({
	ensure_installed = {
		"c",
		"clojure",
		"cmake",
		"comment",
		"cpp",
		"css",
		"dockerfile",
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
