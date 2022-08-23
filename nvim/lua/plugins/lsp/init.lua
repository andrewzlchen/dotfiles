-- Mappings.
local keymap_opts = { noremap=true, silent=true }
local nvim_lsp = require('lspconfig')

local on_attach_formatting = function(client)
  -- if client.resolved_capabilities.document_formatting then
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.cmd [[augroup END]]
  end
end

local on_attach_lsp = function(client, bufnr)
  print("[LSP] Started " .. client.name);

  on_attach_formatting(client)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- set up floating window lsp signatures
  require "lsp_signature".on_attach()
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'gD',         '<Cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
  buf_set_keymap('n', 'gd',         '<Cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  buf_set_keymap('n', 'K',          '<Cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  buf_set_keymap('n', 'gi',         '<cmd>Telescope lsp_implementations<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>D',   '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
  buf_set_keymap('n', 'gr',         '<cmd>Telescope lsp_references<CR>', keymap_opts)
  buf_set_keymap('n', 'gR',         '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
  buf_set_keymap('n', '<space>e',   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', keymap_opts)
  buf_set_keymap('n', '[d',         '<cmd>lua vim.diagnostic.goto_prev()<CR>', keymap_opts)
  buf_set_keymap('n', ']d',         '<cmd>lua vim.diagnostic.goto_next()<CR>', keymap_opts)
  buf_set_keymap('n', '<space>q',   '<cmd>lua vim.diagnostic.set_loclist()<CR>', keymap_opts)

  buf_set_keymap('n', '<space>ca',   '<cmd>Telescope lsp_code_actions<CR>', keymap_opts)
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local generic_servers = { "gopls", "tsserver" }
for _, lsp in ipairs(generic_servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach_lsp,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = {    
      debounce_text_changes = 150,    
    }    
}
end

nvim_lsp['efm'].setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    on_attach_formatting(client)
  end,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {prettier},
      javascript = {prettier},
      typescriptreact = {prettier},
      javascriptreact = {prettier},
      ["javascript.jsx"] = {prettier},
      ["typescript.tsx"] = {prettier},
      yaml = {prettier},
      json = {prettier},
      html = {prettier},
      less = {prettier},
      markdown = {prettier}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "less",
    "yaml",
    "json",
    "markdown",
    -- "scss",
    -- "css",
  }
}


