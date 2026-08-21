-- Init Lazy Package manager
require("config.lazy")

-- command
vim.opt.number = true
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Size of an indent
vim.opt.softtabstop = 2  -- Number of spaces a <Tab> counts for while performing editing operations
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.clipboard = "unnamedplus" -- to copy paste outside of neovim. make sure xclip installed `sudo apt install x-clip`

-- buffer
vim.keymap.set('n', '<C-s>', ':bd<cr>', { desc = 'close current buffer' })
vim.keymap.set('n', '<C-d>', ':bn<cr>', { desc = 'go to next buffer' })
vim.keymap.set('n', '<C-a>', ':bp<cr>', { desc = 'go to prev buffer' })

-- .tmux.conf
-- to make sure color scheme still work on tmux
--[[
set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"
]]--

