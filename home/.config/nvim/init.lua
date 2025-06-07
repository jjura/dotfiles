--------------------------------------------------------------------------------
-- Command:
--------------------------------------------------------------------------------
vim.cmd [[ colorscheme vim ]]

--------------------------------------------------------------------------------
-- Diagnostic:
--------------------------------------------------------------------------------
local config = {
    virtual_text = true
}

vim.diagnostic.config(config)

--------------------------------------------------------------------------------
-- Global:
--------------------------------------------------------------------------------
vim.g.mapleader           = " "
vim.g.netrw_banner        = false
vim.g.netrw_liststyle     = 3
vim.g.netrw_sort_sequence = "[/]$"
vim.g.netrw_winsize       = -30

--------------------------------------------------------------------------------
-- Option:
--------------------------------------------------------------------------------
vim.opt.colorcolumn    = "80"
vim.opt.completeopt    = "menuone,noinsert,popup"
vim.opt.expandtab      = true
vim.opt.ignorecase     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.shiftwidth     = 4
vim.opt.showcmd        = false
vim.opt.swapfile       = false
vim.opt.tabstop        = 4
vim.opt.undofile       = true
vim.opt.wildignore     = "*.o"
vim.opt.wrap           = false

--------------------------------------------------------------------------------
-- Keymap:
--------------------------------------------------------------------------------
local options = {
    noremap   = true,
    silent    = false,
}

vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", options)
vim.keymap.set("n", "<Leader>e", ":e **/*", options)
vim.keymap.set("n", "<Leader>q", ":Lexplore<CR>", options)

--------------------------------------------------------------------------------
-- Language:
--------------------------------------------------------------------------------
if vim.fn.has("nvim-0.11") == 1
then
    vim.lsp.config.clangd = {
        cmd               = { "clangd" },
        filetypes         = { "c", "cpp" },
        root_markers      = { "compile_commands.json" },
    }

    vim.lsp.enable("clangd")
end

--------------------------------------------------------------------------------
-- Scroll:
--------------------------------------------------------------------------------
local function scroll(keymap)
    local counter = 0
    local lines = math.floor(vim.api.nvim_win_get_height(0) / 2)

    local function callback()
        if counter < lines
        then
            counter = counter + 1
            vim.api.nvim_input(keymap)
            vim.defer_fn(callback, 4)
        end
    end

    callback()
end

local function scroll_down()
    scroll("<C-e>")
end

local function scroll_up()
    scroll("<C-y>")
end

vim.keymap.set("n", "<C-f>", scroll_down, options)
vim.keymap.set("n", "<C-b>", scroll_up, options)
