-- https://github.com/nvim-neotest/neotest

-- run
vim.keymap.set("n", "<localleader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set("n", "<localleader>tn", ':lua require("neotest").run.run()<CR>')
vim.keymap.set("n", "<localleader>tt", ':lua require("neotest").run.run_last()<CR>')
vim.keymap.set("n", "<localleader>td", ':lua require("neotest").run.run({strategy = "dap"})<CR>') -- run nearest test with dap

-- ui
vim.keymap.set("n", "<leader>to", ':lua require("neotest").output_panel.toggle()<CR>')
vim.keymap.set("n", "<leader>ts", ':lua require("neotest").summary.toggle()<CR>')

vim.keymap.set("n", "[n", ':lua require("neotest").jump.prev({ status = "failed" })<CR>')
vim.keymap.set("n", "]n", ':lua require("neotest").jump.next({ status = "failed" })<CR>')
