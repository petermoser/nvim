-- Set global variables in Lua
vim.g.startify_files_number = 11
vim.g.startify_change_to_dir = 0
vim.g.startify_custom_header = {}
vim.g.startify_relative_path = 1
vim.g.startify_use_env = 1

-- Custom startup list, only show MRU from current directory/project
vim.g.startify_lists = {
  { type = 'dir', header = { 'Files ' .. vim.fn.getcwd() } },
  { type = 'sessions', header = { 'Sessions' } },
  { type = 'bookmarks', header = { 'Bookmarks' } },
  { type = 'commands', header = { 'Commands' } },
}

-- Define startify commands
vim.g.startify_commands = {
  { up = { 'Update Plugins', ':PackerSync' } },
  { ug = { 'Upgrade Plugin Manager', ':PackerUpdate' } },
}

-- Define startify bookmarks
vim.g.startify_bookmarks = {
  { c = '~/.config/nvim/init.lua' },
  { g = '~/.gitconfig' },
  { z = '~/.zshrc' },
}

-- Auto commands using Lua in Neovim
vim.api.nvim_create_autocmd("User", {
  pattern = "Startified",
  callback = function()
    vim.wo.cursorline = true
  end,
})

-- Mapping <C-s> to Startify command in Lua
vim.api.nvim_set_keymap('n', '<C-s>', ':Startify<CR>', { noremap = true, silent = true })

