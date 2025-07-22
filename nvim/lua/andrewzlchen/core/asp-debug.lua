-- Run this after plugins have loaded so that 'dap' exists
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- require('dap').set_log_level 'DEBUG'

    -- require("dap").adapters.cppdbg = {
    --   id = "cppdbg",
    --   type = "executable",
    --   command = "/home/ubuntu/.vscode-server/extensions/ms-vscode.cpptools-1.25.3-linux-x64/debugAdapters/bin/OpenDebugAD7",
    -- }

    require("dap").adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
      enrich_source = true,
    }
    require("dap").configurations.cpp = {
      {
        name = "Attach mongod",
        -- type = "cppdbg",
        type = "codelldb",
        request = "attach",
        MIMode = "gdb",
        program = "/home/ubuntu/mongo/bazel-bin/install-dist-test/bin/mongod",
        processId = require("dap.utils").pick_process,
        cwd = "/home/ubuntu/mongo/",
        setupCommands = {
          {
            text = "set verbose",
            ignoreFailures = false,
          },
          {
            text = "set directories /home/ubuntu/mongo/",
            ignoreFailures = false,
          },
          {
            text = "set debug-file-directory /home/ubuntu/mongo/",
            ignoreFailures = false,
          },
          {
            description = "Enable pretty-printing for gdb",
            text = "-enable-pretty-printing",
            ignoreFailures = false,
          },
          {
            text = "source /home/ubuntu/mongo/buildscripts/gdb/mongo.py",
            ignoreFailures = false,
          },
          {
            text = "source /home/ubuntu/mongo/buildscripts/gdb/optimizer_printers.py",
            ignoreFailures = false,
          },
          {
            text = "source /home/ubuntu/mongo/buildscripts/gdb/mongo_printers.py",
            ignoreFailures = false,
          },
          {
            text = "source /home/ubuntu/mongo/buildscripts/gdb/mongo_lock.py",
            ignoreFailures = false,
          },
          {
            text = "source /home/ubuntu/mongo/buildscripts/gdb/wt_dump_table.py",
            ignoreFailures = false,
          },
          {
            text = "source /home/ubuntu/mongo/src/third_party/immer/dist/tools/gdb_pretty_printers/autoload.py",
            ignoreFailures = false,
          },
        },
        miDebuggerPath = "/opt/mongodbtoolchain/v4/bin/gdb",
        -- sourceFileMap = {
        -- 	"/proc/self/cwd" = '/home/ubuntu/mongo/'
        -- }
      },
    }
  end,
})
