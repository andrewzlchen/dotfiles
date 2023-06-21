-- breakpoints
vim.keymap.set("n", "<localleader>db", ":lua require'dap'.toggle_breakpoint()<CR>")

-- running through code
vim.keymap.set("n", "<localleader>dc", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<localleader>do", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<localleader>di", ":lua require'dap'.step_into()<CR>")

-- ui
vim.keymap.set("n", "<localleader>dro", ":lua require'dap'.repl.open()<CR>")
