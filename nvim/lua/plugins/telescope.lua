local keymap_opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
-- project searchability
map('n', '<leader>fq', '<cmd>lua require("telescope.actions").open_qflist()<cr>', keymap_opts)
map('n', '<leader><Space>', '<cmd>lua require("plugins.telescope").project_files()<CR>', keymap_opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', keymap_opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', keymap_opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', keymap_opts)
map('n', '<leader>fp', '<cmd>lua require"telescope".extensions.project.project{}<CR>', keymap_opts)

map('n', '<leader>gf', '<cmd>Telescope git_status<CR>', keymap_opts)

-- lsp maps
map('n', '<leader>pp', '<cmd>Telescope project<cr>', keymap_opts)
map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', keymap_opts)
map('n', '<leader>lwd', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', keymap_opts)
map('n', '<leader>lwde', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics({severity = ":error:"})<cr>', keymap_opts)
map('n', '<leader>ldd', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>', keymap_opts)
map('n', '<leader>la', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', keymap_opts)
map('n', '<leader>im', [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], {noremap=true, silent=true})

-- allow esc in insert mode to quit telescope
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

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

