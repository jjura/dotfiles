local namespace = vim.api.nvim_create_namespace("indent-guides")

local callbacks = {
    [ 1 ] = function (event)
        local options = {
            timeout = 200
        }

        vim.highlight.on_yank(options)
    end,

    [ 2 ] = function (event)
        local options = {
            autotrigger = true
        }

        vim.lsp.completion.enable(true, event.data.client_id, event.buf, options)
    end,

    [ 3 ] = function (event)
        if not vim.v.char:match("[%w_]")
        then
            return
        end

        local position = {
            [ 1 ] = vim.api.nvim_win_get_cursor(0)[2],
            [ 2 ] = vim.api.nvim_get_current_line(),
        }

        local line = string.sub(position[2], 1, position[1])
        local word = string.match(line, "[%w_]*$") or ""

        if string.len(word) >= 3
        then
            vim.schedule(vim.lsp.completion.get)
        end
    end,

    [ 4 ] = function (event)
        local buffer  = vim.api.nvim_get_current_buf()
        local content = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)

        vim.api.nvim_buf_clear_namespace(buffer, namespace, 0, -1)

        for number, line in ipairs(content)
        do
            local _, length = string.find(line, "^%s+")
            local indentation = vim.o.shiftwidth or vim.o.tabstop

            if length and length >= indentation and string.len(line) > 0
            then
                for column = 0, length - 1
                do
                    if column % indentation == 0
                    then
                        local options = {
                            virt_text = {{ "│", "LineNr" }},
                            virt_text_pos = "overlay",
                        }
                        vim.api.nvim_buf_set_extmark(buffer, namespace, number - 1, column, options)
                    end
                end
            end
        end
    end,

    [ 5 ] = function (event)
        local callback = function (event)
            local options = {
                silent = false
            }

            vim.lsp.buf.signature_help(options)
        end

        vim.schedule(callback)

        return "("
    end,

    [ 6 ] = function (event)
        local options = {
            bufnr = 0,
            name  = "clangd",
        }

        local client = vim.lsp.get_clients(options)
        local config = {
            uri = vim.uri_from_bufnr(0)
        }

        local callback = function(error, result)
            if result
            then
                vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
            end
        end

        client[1]:request("textDocument/switchSourceHeader", config, callback)
    end,
}

local events = {
    [ 1 ] = "TextYankPost",
    [ 2 ] = "LspAttach",
    [ 3 ] = "InsertCharPre",
    [ 4 ] = {
        "BufEnter",
        "BufWritePost",
        "TextChanged",
        "TextChangedI",
    }
}

for index, event in ipairs(events)
do
    local options = {
        callback = callbacks[index]
    }

    vim.api.nvim_create_autocmd(event, options)
end

local options = {
    expr = true,
}

vim.keymap.set("i", "(",     callbacks[5], options)
vim.keymap.set("n", "<C-h>", callbacks[6])
