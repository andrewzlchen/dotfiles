vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>bd", "<cmd>bp|bd #<CR>", { desc = "Close buffer" }) -- close buffer
keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" }) -- close buffer
keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" }) -- close buffer

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- quickfix list
keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next Quickfix entry" })
keymap.set("n", "[q", "<cmd>cprevious<CR>", { desc = "Previous Quickfix entry" })

-- git
keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open neogit" })
keymap.set("n", "<leader>gm", "<cmd>BlameToggle<CR>", { desc = "Open git blame" })
keymap.set("n", "]m", "<cmd>GitConflictNextConflict<CR>", { desc = "Next conflict" })
keymap.set("n", "[m", "<cmd>GitConflictPrevConflict<CR>", { desc = "Previous conflict" })
keymap.set("n", "<leader>mq", "<cmd>GitConflictListQf<CR>", { desc = "Send conflicts to QF list" })
keymap.set({ "n", "v" }, "<leader>gy", function()
  Snacks.gitbrowse.open({
    open = function(url)
      vim.notify(url)
      vim.fn.setreg("+", url)
      vim.notify("Yanked url to clipboard")
    end,
  })
end, { desc = "Get GitHub url" })
keymap.set({ "n", "v" }, "<leader>gO", function()
  Snacks.gitbrowse()
end, { desc = "Open in GitHub" })

-- lsp
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code actions" })
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })
