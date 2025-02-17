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

local M = {}

M.run_last_command_in_terminal = function()
	-- Get the list of all open buffers
	local bufs = vim.api.nvim_list_bufs()
	local toggleterm_buf = nil

	-- Find the first toggleterm buffer
	for _, buf in ipairs(bufs) do
		-- Check if it's a toggleterm buffer by checking the buffer name
		local name = vim.api.nvim_buf_get_name(buf)
		if name:find("#toggleterm#") then
			toggleterm_buf = buf
			break
		end
	end

	if toggleterm_buf then
		-- Focus the toggleterm window containing the buffer
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == toggleterm_buf then
				vim.api.nvim_set_current_win(win)
				break
			end
		end

		-- Send the keystrokes to execute the last command
		vim.api.nvim_input("i") -- Ensure we're in insert mode
		vim.api.nvim_input("<Up>") -- Navigate to the last command
		vim.api.nvim_input("<CR>") -- Execute it
	else
		print("ToggleTerm is not open.")
	end
end
-- Creaje a user command for easier access
vim.api.nvim_create_user_command("TerminalRerun", M.run_last_command_in_terminal, {})

-- Remove existing mapping for redo
vim.keymap.set("n", "<C-r>", "<Nop>", { noremap = true, silent = true })
-- Key mapping
vim.keymap.set("n", "<C-r>", M.run_last_command_in_terminal, { noremap = true, silent = true })

return M
