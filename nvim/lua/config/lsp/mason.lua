vim.api.nvim_set_keymap('n', '<leader>ls', ':Mason<CR>', { noremap = true, silent = true })

require('mason').setup()
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            local server_config = server_configs[server_name] or {}
            server_config.capabilities = vim.tbl_deep_extend(
                "force",
                default_capabilities,
                server_config.capabilities or {}
            )
            lspconfig[server_name].setup(server_config)
        end,
        ['jdtls'] = function() end,
    },
})
