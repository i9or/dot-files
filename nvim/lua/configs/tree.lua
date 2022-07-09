local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local g = vim.g

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
		icons = {
			show = {
				file = false,
				folder = true,
				git = false,
			},
			glyphs = {
				folder = {
					default = "›",
					empty = "›",
					empty_open = "⌄",
					open = "⌄",
					symlink = "⌄",
					symlink_open = "›",
				}
			}
		},
	},
}

nvimtree.setup(settings)
