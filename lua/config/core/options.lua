vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.background = "dark"
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.showmode = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

vim.o.signcolumn = "auto"
vim.o.cursorline = true
vim.o.colorcolumn = "100"
vim.o.list = true
vim.o.listchars = "tab:> ,trail:-,nbsp:+"
vim.o.inccommand = "split"
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.path = {
    ".",
    "AppData/Local/nvim/lua/**",
    "Documents/101_programming/python/**",
}
vim.opt.wildignore = {
    "**/__pycache__/*",
    "**/node_modules/*",
}
