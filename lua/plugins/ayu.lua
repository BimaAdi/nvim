return {
  "shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd("colorscheme ayu-dark")
  end
}
