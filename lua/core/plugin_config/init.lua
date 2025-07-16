-- color scheme
require("core.plugin_config.colorscheme")

require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.treesitter")
require("core.plugin_config.telescope")
require("core.plugin_config.lsp_config")
require("core.plugin_config.toggleterm")
require("core.plugin_config.gen")
require("core.plugin_config.fugitive")
require("core.plugin_config.startify")
require("core.plugin_config.conform")
require("core.plugin_config.cmp")
require("core.plugin_config.copilot")
require("core.plugin_config.dadbod")
require("core.plugin_config.claude-code")
-- require("core.plugin_config.avante")
require("core.plugin_config.code-companion")

-- auto open the following plugins

-- Open on startup
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		vim.cmd("NvimTreeOpen")
		vim.cmd("wincmd p")
	end,
	once = true,
})
