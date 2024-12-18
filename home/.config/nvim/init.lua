-- init.lua

-- command:
vim.cmd [[ colorscheme vim ]]

-- global:
vim.g.c_syntax_for_h      = true
vim.g.mapleader           = " "
vim.g.netrw_banner        = false
vim.g.netrw_liststyle     = 3
vim.g.netrw_sort_sequence = "[/]$"
vim.g.netrw_winsize       = -30

-- option:
vim.opt.colorcolumn    = "80"
vim.opt.expandtab      = true
vim.opt.ignorecase     = true
vim.opt.number         = true
vim.opt.pumheight      = 8
vim.opt.relativenumber = true
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.termguicolors  = true
vim.opt.undofile       = true
vim.opt.wrap           = false

-- option:
vim.opt.completeopt:append { "menuone", "noinsert" }
vim.opt.completeopt:remove { "preview" }

-- keymap:
vim.keymap.set("n", "<Leader>e", ":e **/*",       { noremap = true, silent = false })
vim.keymap.set("n", "<Leader>q", ":Lexplore<CR>", { noremap = true, silent = true  })

-- keymap:
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>",                { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>",      vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>D",  vim.lsp.buf.declaration,    { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>R",  vim.lsp.buf.rename,         { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>a",  vim.lsp.buf.code_action,    { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>d",  vim.lsp.buf.definition,     { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>h",  vim.lsp.buf.hover,          { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>r",  vim.lsp.buf.references,     { noremap = true, silent = true })
