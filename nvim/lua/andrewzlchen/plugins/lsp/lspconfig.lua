return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    -- Automatically install lsp servers
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls" },
    })
    -- Automatically enable installed lsp servers
    mason_lspconfig.setup()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local uname = vim.loop.os_uname()
    if uname.machine == "arm64" then
      vim.lsp.config.clangd = {
        -- Set explicit path for ARM builds. clangd does not distribute arm64 version so you need to build it yourself.
        cmd = { "/home/ubuntu/tools/llvm-project/clangd_18.1.0/bin/clangd" },
      }
    end
  end,
}
