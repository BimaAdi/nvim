return {
  "akinsho/bufferline.nvim", version = "4.9.1", dependencies = "nvim-tree/nvim-web-devicons",
  config = function() 
    require("bufferline").setup({})
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
    vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
    vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer (visual order)" })
    vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer (visual order)" })
  end
}
