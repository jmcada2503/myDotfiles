require("autoclose").setup({
    disable_command_mode = false,
    options = {
        disabled_filetypes = {},
        disable_when_touch = false,
        touch_regex = "[%w(%[{]",
        -- Setting keys explicitly or disabling the default enter map
        pair_spaces = false,
    }
})
