-- If the lsp keymaps seem not to work the lsp status can be checked with :LspInfo

-- lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach-keybinds", { clear = true }),
    callback = function(e)
        local keymap = function(keys, func)
            vim.keymap.set("n", keys, func, { buffer = e.buf })
        end
        local builtin = require("telescope.builtin")

        keymap("gd", builtin.lsp_definitions)
        keymap("gD", vim.lsp.buf.declaration)
        keymap("gr", builtin.lsp_references)
        keymap("gI", builtin.lsp_implementations)
        keymap("<leader>D", builtin.lsp_type_definitions)
        keymap("<leader>ds", builtin.lsp_document_symbols)
        keymap("<leader>ws", builtin.lsp_dynamic_workspace_symbols)
        keymap("<leader>rn", vim.lsp.buf.rename)
        keymap("<leader>ca", vim.lsp.buf.code_action)
        keymap("K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end)
    end
})

require('config.lsp.mason')
require('config.lsp.lua')
require('config.lsp.java')
