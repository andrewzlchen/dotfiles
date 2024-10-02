return {
  "FabijanZulj/blame.nvim", -- git blame visualizer
  cmd = { "BlameToggle" },
  config = function()
    require("blame").setup()
  end,
}
