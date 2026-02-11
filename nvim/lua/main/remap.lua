vim.g.mapleader = " "

-- Center after paging up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })

-- Keep visual selection after indenting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Changes keybindings
vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':wq<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':mksession! | :wqa<cr>', { noremap = true, silent = true })

-- Copy file path
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true, desc = "Copy full file path" })

-- Reopen just closed buffer
vim.api.nvim_set_keymap('n', '<leader>rt', ':tabe #<CR>', { noremap = true, silent = true, desc = "Reopen last buffer" })

-- Move through tabs
vim.api.nvim_set_keymap('n', '<leader>l', ':tabnext<CR>', { noremap = true, silent = true, desc = "Move to next buffer" })
vim.api.nvim_set_keymap('n', '<leader>h', ':tabprevious<CR>', { noremap = true, silent = true, desc = "Move to previousbuffer" })
vim.api.nvim_set_keymap("n", "<leader>mh", ":-tabmove<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ml", ":+tabmove<CR>", { noremap = true })
