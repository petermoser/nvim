require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = {
				name = "anthropic",
				model = "claude-sonnet-4-5-20250929",
			},
		},
		inline = {
			adapter = {
				name = "anthropic",
				model = "claude-sonnet-4-5-20250929",
			},
		},
		agent = {
			adapter = {
				name = "anthropic",
				model = "claude-sonnet-4-5-20250929",
			},
		},
	},
	extensions = {
		history = { enabled = true },
	},
	display = {
		chat = {
			window = {
				width = 0.33,
			},
		},
		inline = {
			-- Show diff for inline completions
			diff = {
				enabled = true,
			},
		},
	},
})
