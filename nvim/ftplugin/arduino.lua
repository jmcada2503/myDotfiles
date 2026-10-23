-- Run arduino commands (compile/upload output, serial monitor) through vim-slime
-- in a tmux pane instead of a vim terminal buffer
vim.g.arduino_use_slime = 1

vim.keymap.set('n', '<leader>aa', '<cmd>ArduinoAttach<CR>', { buffer = true, desc = 'Arduino attach' })
vim.keymap.set('n', '<leader>av', '<cmd>ArduinoVerify<CR>', { buffer = true, desc = 'Arduino verify' })
vim.keymap.set('n', '<leader>au', '<cmd>ArduinoUpload<CR>', { buffer = true, desc = 'Arduino upload' })
vim.keymap.set('n', '<leader>aus', '<cmd>ArduinoUploadAndSerial<CR>', { buffer = true, desc = 'Arduino upload and open serial monitor' })
vim.keymap.set('n', '<leader>as', '<cmd>ArduinoSerial<CR>', { buffer = true, desc = 'Arduino open serial monitor' })
vim.keymap.set('n', '<leader>ab', '<cmd>ArduinoChooseBoard<CR>', { buffer = true, desc = 'Arduino choose board' })
vim.keymap.set('n', '<leader>ap', '<cmd>ArduinoChooseProgrammer<CR>', { buffer = true, desc = 'Arduino choose programmer' })
