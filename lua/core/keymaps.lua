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

-- Remove existing mapping for redo
vim.keymap.set("n", "<C-r>", "<Nop>", { noremap = true, silent = true })
-- Map Shift+U to redo
vim.keymap.set("n", "U", ":redo<CR>", { noremap = true, silent = true })

-- Map uppercase 'J' to a no-operation command
vim.keymap.set("n", "J", "<Nop>", { noremap = true })

vim.keymap.set("n", "lg", ":LazyGit<CR>", { noremap = true, silent = true })

local chatgpt = require("chatgpt")
local wk = require("which-key")
wk.register({
  c = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  }
})
