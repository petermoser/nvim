-- Configures the auto completion-nvim plugin
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- Dummy snippet expander (required by nvim-cmp but not used)
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(), -- Optional: Add borders to the completion window
		documentation = cmp.config.window.bordered(), -- Show documentation window with borders
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
		["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
		["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
		["<C-e>"] = cmp.mapping.abort(), -- Abort completion
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
		["<C-n>"] = cmp.mapping.select_next_item(), -- Move to next item
		["<C-p>"] = cmp.mapping.select_prev_item(), -- Move to previous item
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})
