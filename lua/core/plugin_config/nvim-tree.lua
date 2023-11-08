vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<c-g>', ':NvimTreeFindFile<CR>')


-- Autocommand that runs the NvimTreeFindFile command after Neovim has finished loading
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "NvimTreeFindFile",
})

