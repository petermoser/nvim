-- Return the list of plugins to lazy.nvim
return {
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
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
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

	-- ChatGPT.nvim
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("chatgpt").setup()
		end,
	},
}
