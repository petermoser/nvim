-- Configures the auto completion-nvim plugin
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
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
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
