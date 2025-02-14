return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  commit = "e76cb03",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add file to harpoon list" })

    vim.keymap.set("n", "<leader>ss", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Go to file 1" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Go to file 2" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Go to file 3" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Go to file 4" })
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(5)
    end, { desc = "Go to file 5" })
    vim.keymap.set("n", "<leader>6", function()
      harpoon:list():select(6)
    end, { desc = "Go to file 6" })
    vim.keymap.set("n", "<leader>7", function()
      harpoon:list():select(7)
    end, { desc = "Go to file 7" })
    vim.keymap.set("n", "<leader>8", function()
      harpoon:list():select(8)
    end, { desc = "Go to file 8" })
    vim.keymap.set("n", "<leader>9", function()
      harpoon:list():select(9)
    end, { desc = "Go to file 9" })
    vim.keymap.set("n", "<leader>0", function()
      harpoon:list():select(0)
    end, { desc = "Go to file 10" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>h", function()
      harpoon:list():prev()
    end, { desc = "Go to previous harpoon file" })
    vim.keymap.set("n", "<leader>l", function()
      harpoon:list():next()
    end, { desc = "Go to next harpoon file" })
    print("loaded harpoon")
  end,
}
