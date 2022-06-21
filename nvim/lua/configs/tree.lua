local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local g = vim.g

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
	folders = 1,
	files = 0,
	git = 0,
}

g.nvim_tree_icons = {
	folder = {
		default = "›",
		empty = "›",
		empty_open = "⌄",
		open = "⌄",
		symlink = "⌄",
		symlink_open = "›",
	},
}

local settings = {
	filters = {
		dotfiles = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = { "dashboard" },
	open_on_tab = false,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {
		side = "left",
		width = 25,
		hide_root_folder = true,
	},
	git = {
		enable = false,
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = false,
			window_picker = {
				exclude = {
					filetype = { "notify", "packer", "qf" },
					buftype = { "terminal" },
				},
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
}

nvimtree.setup(settings)
