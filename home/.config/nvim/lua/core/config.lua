-- config.lua

vim.g.c_syntax_for_h = true
vim.g.mapleader = " "
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = -30
vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt:append { "menuone", "noselect", "noinsert" }
vim.opt.completeopt:remove { "preview" }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.listchars = "space:·,tab:→ "
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumheight = 8
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wildignore:append { "*.o" }
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.writebackup = true
