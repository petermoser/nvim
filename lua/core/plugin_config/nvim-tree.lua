vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	-- other configuration settings
	-- view = {
	-- 	-- when opening a file with C-v, the file will be opened on the right
	-- 	side = "right",
	-- },
})

vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-g>", ":NvimTreeFindFile<CR>")
