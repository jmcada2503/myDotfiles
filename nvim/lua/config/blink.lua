require('blink.cmp').setup({
    -- 'default' sets up Ctrl+n / Ctrl+p to navigate, and Ctrl+y to confirm
    keymap = {
        preset = 'default',

        -- Confirm the selected completion (falls back to a real Enter when the menu is closed)
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        -- Close the completion menu
        ['<C-q>'] = { 'hide', 'fallback' },

        -- Show/toggle docs for the completion menu (default preset behavior),
        -- and toggle the signature help window when there's nothing else to show
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'show_signature', 'hide_signature', 'fallback' },
        -- No longer needed now that <C-space> handles the signature toggle
        ['<C-k>'] = false,
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },

    -- Shows a floating window with the current parameter's signature while
    -- typing inside a call's parens; toggled manually with <C-space>
    signature = {
        enabled = true,
        window = { border = 'rounded' },
    },

    completion = {
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
    },

    -- Tell blink where to look for completions
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
