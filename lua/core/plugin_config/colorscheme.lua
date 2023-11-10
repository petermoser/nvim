--require("kanagawa").setup({
-- compile = false, -- enable compiling the colorscheme
-- undercurl = true, -- enable undercurls
-- commentStyle = { italic = true },
-- functionStyle = {},
-- keywordStyle = { italic = true },
-- statementStyle = { bold = true },
-- typeStyle = {},
-- transparent = false, -- do not set background color
-- dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- colors = { -- add/modify theme and palette colors
-- 	palette = {},
-- 	theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
-- },
-- overrides = function(colors) -- add/modify highlights
-- 	return {}
-- end,
-- theme = "wave", -- Load "wave" theme when 'background' option is not set
-- background = { -- map the value of 'background' option to a theme
-- 	dark = "wave", -- try "dragon" !
-- 	light = "lotus",
-- },
--])

-- setup must be called before loading
--[[ v ]]
-- im.cmd("colorscheme kanagawa-wave")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme kanagawa-lotus")

-- require("gruvbox").setup({
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   terminal_colors = true, -- add neovim terminal colors
--   transparent_mode = true,
-- })
--
-- vim.o.termguicolors = true
-- vim.cmd [[ colorscheme gruvbox]]
--

-- vim.cmd("colorscheme tokyonight-night") -- for night themes
-- vim.cmd("colorscheme tokyonight-storm") -- for storm themes
-- vim.cmd("colorscheme tokyonight-day") -- for day theme
vim.cmd("colorscheme tokyonight-moon") -- for moon theme