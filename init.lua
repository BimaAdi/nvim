--[[
NVIM v0.12.4
Build type: Release
LuaJIT 2.1.1774638290
Run "nvim -V1 -v" for more info
]]--

-- Init Lazy Package manager
require("config.lazy")

-- command
vim.opt.number = true
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Size of an indent
vim.opt.softtabstop = 2  -- Number of spaces a <Tab> counts for while performing editing operations
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.clipboard = "unnamedplus" -- to copy paste outside of neovim. make sure xclip installed `sudo apt install x-clip`
-- make sure code changed when edited outside neovim (tools formater / AI Agent)
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.bo.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- buffer
vim.keymap.set("n", "<C-q>", ":bd<cr>", { desc = "close current buffer" })
vim.keymap.set("n", "<C-d>", ":bn<cr>", { desc = "go to next buffer" })
vim.keymap.set("n", "<C-a>", ":bp<cr>", { desc = "go to prev buffer" })

-- Normal mode: Comment/Uncomment current line
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment line" })

-- Visual mode: Comment/Uncomment selection
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment selection" })

-- .tmux.conf
-- to make sure color scheme still work on tmux
-- and autoread working on while open using tmux
--[[
set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"
set -g focus-events on
]]--

-- format code using .editorconfig
-- open file on normal mode type :retab then type gg=G

