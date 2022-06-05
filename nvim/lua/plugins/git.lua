local map = vim.api.nvim_set_keymap

local keymap_opts = { noremap=true, silent=true }

-- Lazygit
map('n', '<leader>gg', '<cmd>LazyGit<CR>', keymap_opts)

-- Fugitive
map('n', '<leader>gst', '<cmd>G<CR>', keymap_opts)
map('n', '<leader>gbl', '<cmd>G blame<CR>', keymap_opts)
map('n', '<leader>gpu', '<cmd>G push<CR>', keymap_opts)
map('n', '<leader>gpf', '<cmd>G push --force<CR>', keymap_opts)
map('n', '<leader>glum', '<cmd>G pull upstream master<CR>', keymap_opts)
map('n', '<leader>gre', '<cmd>G reset<CR>', keymap_opts)
map('n', '<leader>grsh', '<cmd>G reset --soft HEAD~<CR>', keymap_opts)

-- Git Gutter
map('n', '<leader>gj', '<cmd>GitGutterNextHunk<CR>', keymap_opts)
map('n', '<leader>gk', '<cmd>GitGutterPrevHunk<CR>', keymap_opts)
map('n', '<leader>gp', '<cmd>GitGutterPreviewHunk<CR>', keymap_opts)
map('n', '<leader>guh', '<cmd>GitGutterUndoHunk<CR>', keymap_opts)
