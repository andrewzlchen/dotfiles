-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- overall discoverability
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ft", ":Telescope file_browser<CR>", {})
vim.keymap.set("n", "<leader>f.", ":Telescope file_browser path=%:p:h<CR>", {})

-- navigation
vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>", {})

-- project discoverability
vim.keymap.set("n", "<leader><leader>", builtin.git_files, {})
vim.keymap.set("n", "<leader>gg", ":Telescope git_status<CR>", {})
vim.keymap.set("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", {})
vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>", {})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- ["<esc>"] = actions.close,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
		file_ignore_patterns = { "node_modules", "vendor" },
		layout_strategy = "vertical",
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					--       ["<esc>"] = actions.close
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})
