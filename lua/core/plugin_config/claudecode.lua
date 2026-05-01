require("claudecode").setup({
	terminal = {
		split_width_percentage = 0.45,
	},
})

-- Drop to terminal-normal mode when entering the Claude Code terminal window
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	group = vim.api.nvim_create_augroup("ClaudeCodeNormalOnEnter", { clear = true }),
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "terminal" then
			return
		end
		if not vim.api.nvim_buf_get_name(args.buf):lower():find("claude") then
			return
		end
		vim.schedule(function()
			if vim.api.nvim_get_current_buf() ~= args.buf then
				return
			end
			local mode = vim.api.nvim_get_mode().mode
			if mode == "t" or mode == "i" then
				vim.cmd("stopinsert")
			end
		end)
	end,
})
