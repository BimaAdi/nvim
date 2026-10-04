return {
  "akinsho/bufferline.nvim", version = "4.9.1", dependencies = "nvim-tree/nvim-web-devicons",
  config = function() 
    require("bufferline").setup({})
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
    vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
    vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer (visual order)" })
    vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer (visual order)" })
    vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "go to buffer 1" })
    vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "go to buffer 2" })
    vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "go to buffer 3" })
    vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "go to buffer 4" })
    vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "go to buffer 5" })
    vim.keymap.set("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "go to buffer 6" })
  end
}
