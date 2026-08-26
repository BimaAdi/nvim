return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = { "filename", path = 1 }
    })
    vim.opt.showmode = false -- to disable default showmode (normal/insert/visual)
  end
}
