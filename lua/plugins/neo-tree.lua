return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      -- Toggle Neo-tree filesystem view
      vim.keymap.set('n', '<C-e>', '<cmd>Neotree toggle filesystem left<cr>', { desc = 'Toggle Neo-tree' })
      -- if config is define the opts will be ignored
      -- so I add this require so it doesn't get ignored
      require("neo-tree").setup({
        window = {
          position = "left",
          width = 25,
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false          
          },
        },
      })
    end
  }
}
