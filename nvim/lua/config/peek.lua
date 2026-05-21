local peek = require('peek')

vim.keymap.set('n', '<leader>md', function()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end, { desc = 'Toggle markdown preview' })

peek.setup({
  auto_load = false,        -- whether to automatically load preview when
                            -- entering another markdown buffer
  close_on_bdelete = true,  -- close preview window on buffer delete

  syntax = true,            -- enable syntax highlighting, affects performance

  theme = 'dark',           -- 'dark' or 'light'

  update_on_change = true,

  app = 'webview',          -- 'webview', 'browser', string or a table of strings
                            -- explained below

  filetype = { 'markdown', 'md' },  -- list of filetypes to recognize as markdown
})
