require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = {
				name = "anthropic",
				model = "claude-sonnet-4-20250514",
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
	},
})
