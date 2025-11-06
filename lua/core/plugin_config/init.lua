-- Load lualine before colorscheme to avoid autocommand issues
require("core.plugin_config.lualine")

-- color scheme
require("core.plugin_config.colorscheme")
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
require("core.plugin_config.claudecode")
-- require("core.plugin_config.avante")
require("core.plugin_config.code-companion")

-- auto open the following plugins

-- Check for command-line flags
local function has_flag(flag)
	for _, arg in ipairs(vim.v.argv) do
		if arg == flag or arg == "-" .. flag then
			return true
		end
	end
	return false
end

-- Open on startup
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		if has_flag("db") then
			-- Open dadbod UI if -db flag is present
			vim.cmd("DBUIToggle")
		else
			-- Open NvimTree by default
			vim.cmd("NvimTreeOpen")
			vim.cmd("wincmd p")
		end
	end,
	once = true,
})
