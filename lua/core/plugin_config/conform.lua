local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		--    javascript = { { "prettierd", "prettier" } },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { { "prettier" } },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		async = false,
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- use fp key combination for formatting
vim.keymap.set({ "n", "v" }, "fp", function()
	conform.format({
		async = false,
		timeout_ms = 500,
		lsp_fallback = true,
	})
end)
