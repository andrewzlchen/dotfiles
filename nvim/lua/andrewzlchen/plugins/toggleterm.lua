return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    build = ":ToggleTerm",
    config = true,
    keys = {
      { "<leader>j", "<cmd>ToggleTerm<cr>", desc = "Terminal: toggle" },
    },
  },
}
