-- Mappings.
local keymap_opts = { noremap=true, silent=true }
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- local function global_set_option(...) vim.api.nvim_set_option(...) end

    -- set up floating window lsp signatures
    require "lsp_signature".on_attach()

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_set_keymap('n', 'gD',         '<Cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
    buf_set_keymap('n', 'gd',         '<Cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
    buf_set_keymap('n', 'K',          '<Cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
    buf_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
    buf_set_keymap('n', '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
    buf_set_keymap('n', '<leader>D',   '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
    buf_set_keymap('n', '<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
    buf_set_keymap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
    buf_set_keymap('n', '<space>e',   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', keymap_opts)
    buf_set_keymap('n', '[d',         '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', keymap_opts)
    buf_set_keymap('n', ']d',         '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', keymap_opts)
    buf_set_keymap('n', '<space>q',   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', keymap_opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", keymap_opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>rf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", keymap_opts)
    end
end


require('plugins/lsp/lua-ls')

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "gopls", "tsserver", "clojure_lsp" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
end


-- Tree sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go", "javascript", "typescript"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

