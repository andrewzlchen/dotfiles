return {
  "rgroli/other.nvim",
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader>fa",
      function()
        vim.cmd("Other")
      end,
      desc = "Alternate file",
    },
    {
      "<leader>ft",
      function()
        vim.cmd("Other test")
      end,
      desc = "Alternate file - Test",
    },
    {
      "<leader>fs",
      function()
        vim.cmd("Other source")
      end,
      desc = "Alternate file - Source",
    },
    {
      "<leader>fh",
      function()
        vim.cmd("Other header")
      end,
      desc = "Alternate file - Header",
    },
  },
  config = function()
    require("other-nvim").setup({
      mappings = {
        {
          pattern = "(.*)/(.*).cpp",
          target = {
            {
              target = "/%1/%2.h",
              context = "header",
            },
            {
              target = "/%1/tests/%2_test.cpp",
              context = "test",
            },
          },
        },
        {
          pattern = "(.*)/(.*).h",
          target = {
            {
              target = "/%1/%2.cpp",
              context = "source",
            },
            {
              target = "/%1/tests/%2_test.cpp",
              context = "test",
            },
          },
        },
        {
          pattern = "(.*)/tests/(.*)_test.cpp",
          target = {
            {
              target = "/%1/%2.h",
              context = "header",
            },
            {
              target = "/%1/%2.cpp",
              context = "source",
            },
          },
        },
        -- {
        --   pattern = "",
        --   target = "",
        --   context = "",
        -- },
        -- {
        --   pattern = "",
        --   target = "",
        --   context = "",
        -- },
        -- {
        --   pattern = "",
        --   target = "",
        --   context = "",
        -- },
      },
    })
  end,
}
