local present, lspconfig = pcall(require, "lspconfig")

if not present then
	return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
