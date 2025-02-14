vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = "*.idl",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})
