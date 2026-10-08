return {
  "shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd("colorscheme ayu-dark")
    -- change default ayu number color because is to dark for me
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#abb2bf", bold = false })
  end
}
