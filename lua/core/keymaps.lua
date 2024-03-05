-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- insert new line with yanked content
vim.keymap.set("n", "Q", "o<Esc>p", { noremap = true })
-- This maps 'cp' in visual mode to copy the selection to the system clipboard
vim.api.nvim_set_keymap("v", "cp", '"+y', { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
-- For insert mode, we create an anonymous function to save and exit insert mode
vim.keymap.set("i", "fd", function()
	vim.cmd("write")
	-- Return the '<Esc>' key to exit insert mode. We use termcodes to ensure it's treated as a key press.
	return vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
end, { expr = true, noremap = true, silent = true })

-- For normal mode, it's straightforward since we don't need to exit insert mode
vim.keymap.set("n", "fd", ":write<CR>", { noremap = true, silent = true })

-- This maps the Escape key to switch to Normal mode when you're in a terminal buffer.
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
-- two consecutive spacebar presses result in one space
vim.keymap.set("n", "<Space><Space>", ':exe "normal i "<CR>', { noremap = true, silent = true })

-- don't copy the replaced text after pasting in visual mode
vim.keymap.set("v", "p", "pgvy", { noremap = true })

-- Map uppercase 'J' to a no-operation command
vim.keymap.set("n", "J", "<Nop>", { noremap = true })

-- Remap Shift + J to the original line concatenation action
vim.keymap.set("n", "<S-j>", "J", { noremap = true })

-- shortcut for Gwrite and G commit
vim.keymap.set("n", "Gc", ":Gwrite<CR>:G commit<CR>", { noremap = true, silent = true })

-- shortcut for write and quit
vim.keymap.set("i", "wq", function()
	-- Exit insert mode first
	vim.cmd("stopinsert")
	-- Then write and quit
	vim.cmd("wq")
end, { noremap = true, silent = true })
