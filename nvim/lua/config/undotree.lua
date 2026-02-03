vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

require('undotree').setup({
    float_diff = true,
    position = "left",
    keymaps = {
        ["j"] = "move_next",
        ["k"] = "move_prev",
        ["gj"] = "move2parent",
        ["J"] = "move_change_next",
        ["K"] = "move_change_prev",
        ["<cr>"] = "action_enter",
        ["p"] = "enter_diffbuf", -- this can switch between preview and undotree window
        ["q"] = "quit",
        ["S"] = "update_undotree_view",
    }
})
