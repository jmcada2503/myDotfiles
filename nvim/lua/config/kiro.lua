vim.api.nvim_set_keymap('n', '<C-k>', ':KiroChat<CR>', { noremap = true, silent = true, desc = "Open kiro-cli chat" })
vim.api.nvim_set_keymap('n', '<leader>kt', ':KiroChat<CR>', { noremap = true, silent = true, desc = "Open kiro-cli chat" })
vim.api.nvim_set_keymap('n', '<leader>kf', ':KiroAddFileToContext<CR>', { noremap = true, silent = true, desc = "Add file to kiro-cli context" })
vim.api.nvim_set_keymap('v', '<leader>s', ':KiroAddSelectionToContext<CR>', { noremap = true, silent = true, desc = "Add selection to kiro-cli context" })

require("nvim-kiro").setup({
    debug = true,
    window_type = "float",
    reload = true,
    close_keymap = "<C-k>",
    close_normal_keymap = "q",
    cli_agent = {
        binary = 'claude',
        command = 'claude'
    }
})
