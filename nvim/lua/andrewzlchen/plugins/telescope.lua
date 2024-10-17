return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "otavioschwanck/telescope-alternate",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")
    local alternate_telescope = require("telescope-alternate")
    local lga_actions = require("telescope-live-grep-args.actions")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-q>"] = actions.send_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,

            ["<C-k>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            -- freeze the current list and start a fuzzy search in the frozen list
            ["<C-space>"] = actions.to_fuzzy_refine,
          },
        },
      },
    })

    alternate_telescope.setup({
      mappings = {
        -- Streams-specific C++ code
        {
          "(.*)/src/streams/exec/(.*).h",
          {
            { "[1]/src/streams/exec/tests/[2]_test.cpp", "Unit Test" },
            { "[1]/src/streams/exec/[2].cpp", "Source" },
          },
        },
        {
          "(.*)/src/streams/exec/(.*).cpp",
          {
            { "[1]/src/streams/exec/tests/[2]_test.cpp", "Unit Test" },
            { "[1]/src/streams/exec/[2].h", "Header" },
          },
        },
        {
          "(.*)/src/streams/exec/tests/(.*)_test.cpp",
          {
            { "[1]/src/streams/exec/[2].cpp", "Source" },
            { "[1]/src/streams/exec/[2].h", "Header" },
          },
        },
      },

      -- General C++ (doesn't know where tests are)
      {
        "(.*)/(.*).hpp",
        {
          { "[1]/[2].cpp", "Source" },
        },
      },
      {
        "(.*)/(.*).h",
        {
          { "[1]/[2].cpp", "Source" },
        },
      },
      {
        "(.*)/(.*).cpp",
        {
          { "[1]/[2].hpp", "Header" },
        },
        {
          { "[1]/[2].h", "Header" },
        },
      },
      -- presets = { "go" },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("projects")
    telescope.load_extension("telescope-alternate")
    telescope.load_extension("live_grep_args")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader><leader>",
      "<cmd>lua require('telescope.builtin').git_files({layout_strategy='vertical',layout_config={width=0.9}})<CR>",
      { desc = "Fuzzy find git files in cwd" }
    )
    keymap.set(
      "n",
      "<leader>ff",
      "<cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.9}})<CR>",
      { desc = "Fuzzy find files in cwd" }
    )
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find project" })
    keymap.set(
      "n",
      "<leader>fb",
      "<cmd>lua require('telescope.builtin').buffers({layout_strategy='vertical',layout_config={width=0.9}})<CR>",
      { desc = "Find buffer" }
    )
    keymap.set(
      "n",
      "<leader>fa",
      "<cmd>Telescope telescope-alternate alternate_file<cr>",
      { desc = "Find alternate file" }
    )

    keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

    -- for navigating trouble qflist
    keymap.set(
      "n",
      "[f",
      "<cmd>lua require'trouble'.prev()<cr>",
      { desc = "Go to previous entry in trouble quickfix list" }
    )
    keymap.set(
      "n",
      "]f",
      "<cmd>lua require'trouble'.next()<cr>",
      { desc = "Go to next entry in trouble quickfix list" }
    )
  end,
}
