require("nvim-treesitter.configs").setup({
	-- List of parser names or "all"
	ensure_installed = {
		"c",
		"lua",
		"markdown",
		"yaml",
		"vim",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"python",
		"bash",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = true,

	-- Enable syntax highlighting
	highlight = {
		enable = true,
	},

	-- Additional modules
	refactor = {
		highlight_definitions = true, -- Highlight definitions within a scope
		highlight_current_scope = { enable = true }, -- Highlight the current scope

		-- Smart rename functionality
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "gR", -- Keymap to rename the variable under cursor
			},
		},

		-- Navigation: Go to definition, references, etc.
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gd", -- Keymap to go to definition
				list_definitions = "gD", -- List all definitions in the file
				list_definitions_toc = "gO", -- Table of contents for definitions
				goto_next_usage = "<A-*>", -- Go to next usage
				goto_previous_usage = "<A-#>", -- Go to previous usage
			},
		},
	},
})
