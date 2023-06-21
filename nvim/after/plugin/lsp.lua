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

vim.opt.signcolumn = "yes"

lsp.set_preferences({
	set_lsp_keymaps = { omit = { "gr", "gi", "gD" } },
})

lsp.setup()

vim.keymap.set("n", "gD", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")

vim.keymap.set("n", "gr", ":lua vim.lsp.buf.rename()<CR>")
