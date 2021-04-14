-- keymaps

local keymap_opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
map('n', '<leader>fq', '<cmd>lua require("telescope.actions").open_qflist()<cr>', keymap_opts)


-- allow esc in insert mode to quit telescope
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

-- fallback to find_files if git_files doesnt find .git
local M = {}
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end
return M
