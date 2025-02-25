local M = {}

M.setup = function()
	require("avante").setup({
		-- Completion settings
		completion = {
			enabled = true,
			auto_trigger = true,
		},

		-- UI configuration
		ui = {
			window = {
				close_on_escape = false, -- Prevent closing on Escape
			},
			input = {
				close_on_escape = false, -- Prevent closing input on Escape
			},
		},

		-- Keymaps for navigation and selection
		keymaps = {
			-- Navigation
			["<Tab>"] = "select_next_or_fallback",
			["<S-Tab>"] = "select_prev_or_fallback",

			-- Selection
			["<CR>"] = "confirm",

			-- Prevent Escape from closing Avante
			["<Esc>"] = false,
		},
	})
end

return M
