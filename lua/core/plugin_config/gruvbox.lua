require("gruvbox").setup({
  contrast = "hard", -- can be "hard", "soft" or empty string
  terminal_colors = true, -- add neovim terminal colors
  transparent_mode = true,
})

vim.o.termguicolors = true
vim.cmd [[ colorscheme gruvbox]]


