-- https://github.com/nvim-neotest/neotest

vim.keymap.set("n", "<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set("n", "<leader>tn", ':lua require("neotest").run.run()<CR>')
vim.keymap.set("n", "<leader>tt", ':lua require("neotest").run.run_last()<CR>')
vim.keymap.set("n", "<leader>td", ':lua require("neotest").run.run({strategy = "dap"})<CR>') -- run nearest test with dap
