return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("tokyonight").setup({
      theme = "wave",
    })
    vim.cmd("colorscheme kanagawa")
  end,
}
