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
	vim.cmd("stopinsert")
	vim.cmd("write")
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

-- shortcut for Gwrite and G commit in fugitive:Gwrite
vim.keymap.set("i", "gco", function()
	-- Exit insert mode first
	vim.cmd("stopinsert")
	-- Then write and quit
	vim.cmd("Gwrite")
	vim.cmd("G commit")
end, { noremap = true, silent = true })

-- shortcut for Gwrite and G commit and push
vim.keymap.set("n", "gco", function()
	-- Exit insert mode first
	vim.cmd("stopinsert")
	-- Then write and quit
	vim.cmd("Gwrite")
	vim.cmd("G commit")
	vim.cmd("G push")
end, { noremap = true, silent = true })

-- shortcut for write, quit and git push
vim.keymap.set("i", "wq", function()
	-- Exit insert mode first
	vim.cmd("stopinsert")
	-- Then write and quit
	vim.cmd("wq")
end, { noremap = true, silent = true })

vim.keymap.set("i", "gaa", function()
	vim.cmd("stopinsert")
	vim.cmd("Gwrite")
end, { noremap = true, silent = true })

vim.keymap.set("n", "gaa", function()
	vim.cmd("stopinsert")
	vim.cmd("Gwrite")
end, { noremap = true, silent = true })
