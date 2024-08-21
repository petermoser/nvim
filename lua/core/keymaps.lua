-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- set the leader key to space
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

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

-- Remove existing mapping for redo
vim.keymap.set("n", "<C-r>", "<Nop>", { noremap = true, silent = true })
-- Map Shift+U to redo
vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "lg", ":LazyGit<CR>", { noremap = true, silent = true })

-- to open another terminial window use space t
vim.keymap.set("n", "t1", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "t2", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "t3", "<cmd>3ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "t4", "<cmd>4ToggleTerm<CR>", { noremap = true, silent = true })

-- ChatGPT keymaps
vim.keymap.set("v", "<leader>c", "<ESC>:ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>f", "<ESC>:ChatGPTRun fix_bugs<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>x", "<ESC>:ChatGPTRun explain_code<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>o", "<ESC>:ChatGPTRun optimize_code<CR>", { noremap = true, silent = true })

