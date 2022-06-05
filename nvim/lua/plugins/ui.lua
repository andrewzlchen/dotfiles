local keymap_opts = { noremap=true, silent=true }

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>NvimTreeFindFile<CR>', keymap_opts)

-- Colorscheme
vim.cmd [[ 
  colo onedark
]]

--- helper funcs
vim.cmd([[
    function! FilenameForLightline()
        return expand('%')
    endfunction
]])

