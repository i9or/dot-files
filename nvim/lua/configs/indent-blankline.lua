local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
	return
end

indent_blankline.setup({
	indentLine_enabled = 1,
	filetype_exclude = {
		"help",
		"terminal",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"lsp-installer",
		"alpha",
		"",
	},
	buftype_exclude = { "terminal" },
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
})
