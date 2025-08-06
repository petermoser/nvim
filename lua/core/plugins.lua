-- Ensure lazy.nvim is installed and added to the runtime path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- Bootstrap lazy.nvim
	vim.fn.system({
		"git",
		"clone",
		"--branch=stable", -- Use the latest stable release
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Return the list of plugins to lazy.nvim
local plugins = {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	-- Color schemes
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Load during startup
		priority = 1000, -- Ensure it loads first
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- Lualine (status line)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	},

	-- Nvim-tree (file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- Nvim-treesitter (syntax highlighting)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Gen.nvim (AI code generation)
	{
		"david-kunz/gen.nvim",
	},

	-- Vim-fugitive (Git integration)
	{
		"tpope/vim-fugitive",
	},

	-- Telescope UI Select
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},

	-- Vim-startify (start screen)
	{
		"mhinz/vim-startify",
	},

	-- Autocompletion plugins
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source
			"hrsh7th/cmp-buffer", -- Buffer source
			"hrsh7th/cmp-path", -- Path source
			"hrsh7th/cmp-cmdline", -- Cmdline source
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- Snippet completions
		},
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
	},

	-- Conform.nvim (formatters)
	{
		"stevearc/conform.nvim",
	},

	-- Nvim-notify (notification manager)
	{
		"rcarriga/nvim-notify",
	},

	-- Comment.nvim (commenting utility)
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- ToggleTerm.nvim (terminal integration)
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},

	-- Telescope.nvim (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Mason and LSP configuration
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			-- Optionally, configure lspconfig here or in core.plugin_config
		end,
	},

	-- Lazygit.nvim (Git UI)
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- Set up an autocommand to map Esc within LazyGit buffers
			vim.cmd([[
        augroup LazyGit
          autocmd!
          autocmd FileType lazygit tnoremap <buffer> <Esc> <C-c>
        augroup END
      ]])
		end,
	},
	{
		"tpope/vim-dadbod",
		lazy = true, -- Load lazily
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" }, -- UI depends on vim-dadbod
		cmd = { "DBUI", "DBUIToggle", "DBUIFindBuffer", "DBUIRenameBuffer" }, -- Lazy load on these commands
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1 -- Optional: Enables Nerd Fonts for better visuals
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = { "tpope/vim-dadbod" }, -- Autocompletion depends on vim-dadbod
	},

	-- ChatGPT.nvim
	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"folke/trouble.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("chatgpt").setup()
	-- 	end,
	-- },
	--
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{
				"<leader>cs",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
		},
		-- comment the following line to ensure hub will be ready at the earliest
		cmd = "MCPHub", -- lazy load by default
		build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
		-- uncomment this if you don't want mcp-hub to be available globally or can't use -g
		-- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
		config = function()
			require("mcphub").setup()
		end,
	},
	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	version = "v0.0.24",
	-- 	build = "make",
	-- 	config = function()
	-- 		require("core.plugin_config.avante").setup()
	-- 	end,
	-- 	dependencies = {
	-- 		-- Core dependencies
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	--
	-- 		-- File selector and completion
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 		"nvim-tree/nvim-web-devicons",
	--
	-- 		-- Image support
	-- 		{
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = { insert_mode = true },
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	--
	-- 		-- Markdown rendering
	-- 		{
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			opts = { file_types = { "markdown", "Avante" } },
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- },
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp", -- Optional: for using slash commands and variables in the chat buffer
			"nvim-telescope/telescope.nvim", -- Optional: for using slash commands
			"ravitemer/codecompanion-history.nvim",
			{ "stevearc/dressing.nvim", opts = {} }, -- Optional: for prettier inputs
		},
	},
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								default = "~/Projects/neorg",
								coverstar = "~/Projects/neorg/norae",
								mindly = "~/Projects/neorg/mindly",
								ml = "~/Projects/neorg/ml",
							},
							default_workspace = "default",
						},
					},
				},
			})
		end,
	},
}
local opts = {}

-- Load plugins using lazy.nvim
require("lazy").setup(plugins, opts)
