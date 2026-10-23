vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

require('undotree').setup({
    float_diff = true,
    position = "left",
    keymaps = {
        ["move_next"] = "j",
        ["move_prev"] = "k",
        ["move2parent"] = "gj",
        ["move_change_next"] = "J",
        ["move_change_prev"] = "K",
        ["action_enter"] = "<cr>",
        ["enter_diffbuf"] = "p", -- this can switch between preview and undotree window
        ["quit"] = "q",
        ["update_undotree_view"] = "S",
    }
})
