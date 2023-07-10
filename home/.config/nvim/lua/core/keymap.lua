-- keymap.lua

-- core
vim.keymap.set("n", "<Leader>e",  ":e **/*",                  { noremap = true, silent = false })
vim.keymap.set("n", "<Leader>q",  ":Lexplore<CR>",            { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>tc", ":tabnew<CR>",              { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>tn", ":tabnext<CR>",             { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>tp", ":tabprevious<CR>",         { noremap = true, silent = true  })

-- language
vim.keymap.set("i", "<C-Space>",  "<C-x><C-o>",               { noremap = true, silent = true  })
vim.keymap.set("i", "<C-s>",      vim.lsp.buf.signature_help, { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>D",  vim.lsp.buf.declaration,    { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>R",  vim.lsp.buf.rename,         { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>a",  vim.lsp.buf.code_action,    { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>d",  vim.lsp.buf.definition,     { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>h",  vim.lsp.buf.hover,          { noremap = true, silent = true  })
vim.keymap.set("n", "<Leader>r",  vim.lsp.buf.references,     { noremap = true, silent = true  })
