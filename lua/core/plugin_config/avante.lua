-- Avante.nvim Configuration
-- AI-powered coding assistant with Claude integration
local M = {}

-- Configuration constants
local CONFIG = {
	-- Provider settings
	PROVIDER = "claude",
	--	MODEL = "claude-3-7-sonnet-20250219",
	MODEL = "claude-sonnet-4-20250514",
	TEMPERATURE = 0,
	MAX_TOKENS = 20480,
	TOP_P = 0.95,

	-- UI settings
	WINDOW_WIDTH = 35,
	WINDOW_POSITION = "right",

	-- Keybinding prefixes
	LEADER_PREFIX = "<leader>a",
}

-- Keymap definiations
local KEYMAPS = {
	global = {
		ask = CONFIG.LEADER_PREFIX .. "a",
		edit = CONFIG.LEADER_PREFIX .. "e",
		refresh = CONFIG.LEADER_PREFIX .. "r",
		close_all = CONFIG.LEADER_PREFIX .. "c",
		toggle = CONFIG.LEADER_PREFIX .. "t",
	},

	buffer = {
		close = { "<C-c>", "<C-q>", "q" },
		apply_all = "A",
		apply_cursor = "a",
		switch_windows = "<Tab>",
		reverse_switch = "<S-Tab>",
	},

	diff = {
		ours = "co",
		theirs = "ct",
		all_theirs = "ca",
		both = "cb",
		cursor = "cc",
		next = "]x",
		prev = "[x",
	},

	suggestion = {
		accept = "<M-l>",
		next = "<M-]>",
		prev = "<M-[>",
		dismiss = "<C-]>",
	},
}

-- Provider configuration
local function get_provider_config()
	return {
		provider = CONFIG.PROVIDER,
		auto_suggestions = false,
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				model = CONFIG.MODEL,
				extra_request_body = {
					temperature = CONFIG.TEMPERATURE,
					max_tokens = CONFIG.MAX_TOKENS,
					top_p = CONFIG.TOP_P,
				},
			},
		},
	}
end

-- Behavior configuration
local function get_behavior_config()
	return {
		auto_suggestions = false,
		auto_set_highlight_group = true,
		auto_set_keymaps = false, -- Disable auto keymaps to prevent Escape from closing
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = true,
		disable_escape_to_close = true, -- Explicitly disable Escape to close
	}
end

-- Window configuration
local function get_windows_config()
	return {
		position = CONFIG.WINDOW_POSITION,
		wrap = true,
		width = CONFIG.WINDOW_WIDTH,
		sidebar_header = {
			align = "center",
			rounded = false,
		},
	}
end

-- Mappings configuration (prevents Escape from closing)
local function get_mappings_config()
	return {
		ask = KEYMAPS.global.ask,
		edit = KEYMAPS.global.edit,
		refresh = KEYMAPS.global.refresh,

		diff = KEYMAPS.diff,
		suggestion = KEYMAPS.suggestion,

		jump = {
			next = "]]",
			prev = "[[",
		},

		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},

		sidebar = {
			apply_all = KEYMAPS.buffer.apply_all,
			apply_cursor = KEYMAPS.buffer.apply_cursor,
			switch_windows = KEYMAPS.buffer.switch_windows,
			reverse_switch_windows = KEYMAPS.buffer.reverse_switch,
		},
	}
end

-- Additional configuration
local function get_additional_config()
	return {
		file_selector = { provider = "telescope" },
		hints = { enabled = true },
		diff = {
			autojump = true,
			list_opener = "copen",
		},
		highlights = {
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
	}
end

-- Set up global keymaps
local function setup_global_keymaps()
	local keymap = vim.keymap.set
	local desc_prefix = "Avante: "

	-- Main functionality keymaps
	keymap("n", KEYMAPS.global.ask, "<cmd>AvanteAsk<cr>", { desc = desc_prefix .. "Ask" })
	keymap("v", KEYMAPS.global.ask, "<cmd>AvanteAsk<cr>", { desc = desc_prefix .. "Ask" })
	keymap("n", KEYMAPS.global.edit, "<cmd>AvanteEdit<cr>", { desc = desc_prefix .. "Edit" })
	keymap("v", KEYMAPS.global.edit, "<cmd>AvanteEdit<cr>", { desc = desc_prefix .. "Edit" })
	keymap("n", KEYMAPS.global.refresh, "<cmd>AvanteRefresh<cr>", { desc = desc_prefix .. "Refresh" })
	keymap("n", KEYMAPS.global.toggle, "<cmd>AvanteToggle<cr>", { desc = desc_prefix .. "Toggle" })

	-- Global close all windows keymap
	keymap("n", KEYMAPS.global.close_all, function()
		local avante_buffers = vim.tbl_filter(function(buf)
			local ft = vim.bo[buf].filetype
			return ft == "Avante" or ft == "AvanteInput"
		end, vim.api.nvim_list_bufs())

		for _, buf in ipairs(avante_buffers) do
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end, { desc = desc_prefix .. "Close all windows" })
end

-- Set up buffer-specific keymaps for Avante buffers
local function setup_buffer_keymaps()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "Avante", "AvanteInput" },
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			local keymap = vim.keymap.set
			local desc = "Close Avante window"

			-- Multiple ways to close since Escape is disabled
			for _, key in ipairs(KEYMAPS.buffer.close) do
				keymap("n", key, "<cmd>close<cr>", { buffer = buf, desc = desc })
			end

			-- Explicitly remap Escape to do nothing in normal mode, but preserve Ctrl-[
			keymap("n", "<Esc>", "<Nop>", { buffer = buf, desc = "Prevent closing with Escape" })
			keymap("n", "<C-[>", "<Esc>", { buffer = buf, desc = "Allow Ctrl-[ to work as escape" })

			-- In insert mode, Escape should still exit to normal mode
			keymap("i", "<Esc>", "<Esc>", { buffer = buf, desc = "Exit to normal mode" })
			keymap("i", "<C-[>", "<Esc>", { buffer = buf, desc = "Allow Ctrl-[ to work as escape" })
		end,
	})
end
-- Validate environment and configuration
local function validate_setup()
	-- Check for API key
	if not os.getenv("ANTHROPIC_API_KEY") then
		vim.notify(
			"Warning: ANTHROPIC_API_KEY environment variable not set. " .. "Avante may not work properly without it.",
			vim.log.levels.WARN,
			{ title = "Avante Configuration" }
		)
	end

	-- Validate provider
	if CONFIG.PROVIDER ~= "claude" then
		vim.notify(
			"Warning: Provider set to '" .. CONFIG.PROVIDER .. "'. " .. "This configuration is optimized for Claude.",
			vim.log.levels.WARN,
			{ title = "Avante Configuration" }
		)
	end
end

-- Main setup function
M.setup = function()
	-- Validate configuration
	validate_setup()

	-- Set up keymaps
	setup_global_keymaps()
	setup_buffer_keymaps()

	-- Configure Avante with organized settings
	local config = vim.tbl_deep_extend(
		"force",
		get_provider_config(),
		{ behaviour = get_behavior_config() },
		{ windows = get_windows_config() },
		{ mappings = get_mappings_config() },
		get_additional_config()
	)

	require("avante").setup(config)

	-- Success notification
	vim.notify(
		"Avante configured successfully with Claude " .. CONFIG.MODEL,
		vim.log.levels.INFO,
		{ title = "Avante Configuration" }
	)
end

-- Export configuration for external access
M.config = CONFIG
M.keymaps = KEYMAPS

return M
