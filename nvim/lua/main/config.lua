-- Set the behavior for tabs and indentation to 4 spaces
vim.opt.tabstop = 4         -- A hard tab character (\t) will be 4 columns wide
vim.opt.shiftwidth = 4      -- Indentation commands (like '>>') will use 4 spaces
vim.opt.softtabstop = 4     -- <Tab> and <BS> will act as 4 spaces in insert mode
vim.opt.expandtab = true    -- Insert spaces when <Tab> is pressed
vim.opt.shiftround = true   -- Rounds up to the nearest multiple of shiftwidth
vim.opt.smarttab = true     -- Makes the tab key behave like the indent key (>>)


vim.opt.relativenumber = true

-- Allways have at least 8 lines above/below the cursor
vim.opt.scrolloff = 8

-- Set search sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true      -- Sensitive when using uppercase letters

