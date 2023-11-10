require("toggleterm").setup({
	size = 15,
	open_mapping = "<C-t>",
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2, -- the degree by which to darken to terminal color, default: 1
	start_in_insert = false,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		border = "single",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
		winblend = 3,
	},
})

-- to open another terminial window use space t
vim.keymap.set("n", "<leader>t", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })
