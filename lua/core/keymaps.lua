-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- insert new line with yanked content
vim.keymap.set('n', 'Q', 'o<Esc>p', { noremap = true })
-- This maps 'cp' in visual mode to copy the selection to the system clipboard
vim.api.nvim_set_keymap('v', 'cp', '"+y', { noremap = true, silent = true })


vim.keymap.set('i', 'jk', '<Esc>', {noremap = true, silent = true})
-- For insert mode, we create an anonymous function to save and exit insert mode
vim.keymap.set('i', 'fd', function()
  vim.cmd('write')
  -- Return the '<Esc>' key to exit insert mode. We use termcodes to ensure it's treated as a key press.
  return vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
end, {expr = true, noremap = true, silent = true})

-- For normal mode, it's straightforward since we don't need to exit insert mode
vim.keymap.set('n', 'fd', ':write<CR>', {noremap = true, silent = true})

