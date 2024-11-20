return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add file to harpoon list" })
    vim.keymap.set("n", "<leader>ss", function()
      toggle_telescope(harpoon:list())
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
