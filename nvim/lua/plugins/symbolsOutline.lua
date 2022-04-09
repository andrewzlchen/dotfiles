local keymap_opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<localleader>so', '<cmd>SymbolsOutline<CR>', keymap_opts)
