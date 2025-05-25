-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- set the leader key to space
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Make the window wider
vim.keymap.set("n", "<leader>k", ":res +10<CR>")
vim.keymap.set("n", "<leader>j", ":res -10<CR>")

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

-- Map Shift+U to redo
vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "lg", ":LazyGit<CR>", { noremap = true, silent = true })

-- to open another terminial window use space t
vim.keymap.set("n", "t1", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "t2", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "t3", "<cmd>3ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "t4", "<cmd>4ToggleTerm<CR>", { noremap = true, silent = true })

-- telescope keymaps
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<c-p>", builtin.find_files, {})
-- show the file history
vim.keymap.set("n", "fo", builtin.oldfiles, {}) -- show the old file history
vim.keymap.set("n", "fb", builtin.buffers, { desc = "Find Buffers" }) -- show the vim buffers
vim.keymap.set("n", "ff", builtin.grep_string, {}) -- search for a the exact string under the cursor
vim.keymap.set("n", "fw", builtin.live_grep, {}) -- type and search results in real time
vim.keymap.set("n", "fg", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
-- vim.keymap.set("n", "fg", builtin.git_commits, { desc = "Search Git Commits" })
-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
-- vim.keymap.set('n', '<C-g>', builtin.git_files, {})

-- neorg keymaps
vim.keymap.set("n", "<Leader>n", ":Neorg<CR>", {})
vim.keymap.set("n", "<Leader>nn", "<Plug>(neorg.dirman.new-note)", {})

-- avante keymaps
vim.keymap.set("n", "<Leader>aa", ":AvanteAsk<CR>", {})
vim.keymap.set("n", "<Leader>ac", ":AvanteChat<CR>", {})
vim.keymap.set("n", "<Leader>ae", ":AvanteEdit<CR>", {})
vim.keymap.set("n", "<Leader>at", ":AvanteToggle<CR>", {})

-- dadbod keymaps
vim.keymap.set("n", "<Leader>db", ":DBUIToggle<CR>", {})
vim.keymap.set("n", "<Leader>ds", "<Plug>(DBUI_SaveQuery)", {})

-- gen plugin
-- vim.keymap.set("v", "<leader>g", ":Gen<CR>")
-- vim.keymap.set("n", "<leader>g", ":Gen<CR>")
-- ChatGPT keymaps
-- vim.keymap.set("v", "<leader>c", "<ESC>:ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>f", "<ESC>:ChatGPTRun fix_bugs<CR>", { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>x", "<ESC>:ChatGPTRun explain_code<CR>", { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>o", "<ESC>:ChatGPTRun optimize_code<CR>", { noremap = true, silent = true })
