-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- start scrolling when we're 7 lines away from margins
vim.opt.scrolloff = 7

vim.opt.undofile = true
vim.opt.undodir = "~/.config/nvim/undodir"

-- search, case insensitive by default except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

--Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- split windows to the right and below
vim.o.splitright = true
