require("core.plugin_config.gruvbox")
require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.treesitter")
require("core.plugin_config.telescope")
require("core.plugin_config.lsp_config")
require("core.plugin_config.toggleterm")
require("core.plugin_config.gen")
require("core.plugin_config.fugitive")
require("core.plugin_config.startify")


-- auto open the following plugins

-- Open on startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "Startify",
})

-- Autocommand that runs the NvimTreeFindFile command after Neovim has finished loading
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "NvimTreeFindFile",
})

