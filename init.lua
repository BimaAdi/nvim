-- Init Lazy Package manager
require("config.lazy")

-- command
vim.opt.number = true
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Size of an indent
vim.opt.softtabstop = 2  -- Number of spaces a <Tab> counts for while performing editing operations
vim.opt.expandtab = true -- Convert tabs to spaces

-- buffer
vim.keymap.set('n', '<C-w>', ':bd<cr>', { desc = 'close current buffer' })
vim.keymap.set('n', '<C-d>', ':bn<cr>', { desc = 'go to next buffer' })
vim.keymap.set('n', '<C-a>', ':bp<cr>', { desc = 'go to prev buffer' })

