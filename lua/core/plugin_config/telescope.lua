local builtin = require("telescope.builtin")

vim.keymap.set("n", "<c-p>", builtin.find_files, {})
-- show the file history
vim.keymap.set("n", "fh", builtin.oldfiles, {})
vim.keymap.set("n", "<C-u>", builtin.grep_string, {})
vim.keymap.set("n", "<C-w>", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })

-- vim.keymap.set('n', '<C-g>', builtin.git_files, {})

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
