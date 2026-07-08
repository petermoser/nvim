require("claudecode").setup({
	-- Launch Claude in auto permission mode (`--enable-auto-mode` doesn't exist;
	-- the CLI uses `--permission-mode auto`). terminal_cmd accepts a full command
	-- string with flags, not just a binary path.
	-- `--settings '{"tui":"default"}'` overrides the global `"tui": "fullscreen"`
	-- in ~/.claude/settings.json: fullscreen draws on the alternate screen, which
	-- leaves nvim's terminal buffer without scrollback to scroll in normal mode.
	terminal_cmd = [[claude --permission-mode auto --settings '{"tui":"default"}']],
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
		-- The `claude agents` terminal (<leader>ca) is meant to stay in
		-- insert/terminal mode, so don't drop it to terminal-normal here.
		if vim.b[args.buf].claude_agents then
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
