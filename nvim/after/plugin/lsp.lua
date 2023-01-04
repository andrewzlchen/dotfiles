local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"gopls",
})

-- run gopls as a daemon
lsp.setup_servers({
	"gopls",
	opts = { cmd = { "gopls", "-remote=auto", "-logfile=auto", "-debug=:0", "-remote.debug=:0", "-rpc.trace" } },
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")

lsp.setup()
