-- TODO this code needs to be cleaned up

local function list_bazel_test_instances()
  -- Get the current buffer name and content
  local filename = vim.fn.expand("%:p") -- Full path of the current file
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- All lines of the current buffer
  local results = {}

  -- Check if the file is valid
  if not filename or filename == "" then
    vim.notify("No file currently open!", vim.log.levels.ERROR)
    return
  end

  -- Get the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {row, col}
  local cursor_line = cursor_pos[1]

  -- Function to extract the body of the `TEST_F` function
  local function extract_function_body(start_line)
    local body = {}
    local opening_braces = 0
    local closing_braces = 0

    -- Start from the line after the match and continue until the function ends
    for i = start_line, #lines do
      local content = lines[i]

      -- Track braces to identify function boundaries
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      table.insert(body, content)

      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return body
  end

  -- Helper function to check if the cursor is inside the function body
  local function is_cursor_inside_function(start_line)
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]

      -- Track braces
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      -- If opening braces exceed closing braces, the cursor may be inside the function
      if opening_braces > 0 and opening_braces > closing_braces then
        -- Check if the cursor line falls in the current line range
        if cursor_line >= start_line and cursor_line <= i then
          return true
        end
      end

      -- If function boundary is reached, we exit the check
      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return false
  end

  -- Find all lines containing TEST_F and extract parameters
  for line_num, line_content in ipairs(lines) do
    local first_param, second_param = line_content:match("TEST.*%s*%(([^,]+)%s*,%s*([^%)]+)%)")
    if first_param and second_param then
      table.insert(results, {
        filename = filename,
        line_num = line_num,
        distance_to_cursor = math.abs(line_num - cursor_line), -- Calculate distance to cursor
        is_cursor_inside = is_cursor_inside_function(line_num), -- Check if cursor is inside this function
        content = line_content,
        first_param = first_param:gsub("%s+", ""), -- Trim whitespace
        second_param = second_param:gsub("%s+", ""), -- Trim whitespace
        body = extract_function_body(line_num), -- Extract the function body
      })
    end
  end

  -- If no instances are found, notify the user
  if #results == 0 then
    vim.notify("No instances of TEST_F found!", vim.log.levels.INFO)
    return
  end

  -- Sort results prioritizing the function the cursor is inside, then functions above the cursor, and finally by distance to the cursor
  table.sort(results, function(a, b)
    if a.is_cursor_inside ~= b.is_cursor_inside then
      return a.is_cursor_inside -- Prioritize functions the cursor is inside
    else
      return a.distance_to_cursor < b.distance_to_cursor -- Then sort by proximity to cursor
    end
  end)

  -- Use Telescope to list instances
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Select Test to Execute",
      finder = require("telescope.finders").new_table({
        results = results,
        entry_maker = function(entry)
          return {
            value = entry,
            display = string.format(
              ":%d %s (%s, %s)",
              entry.line_num,
              entry.content,
              entry.first_param,
              entry.second_param
            ),
            ordinal = string.format("%s %s %s", entry.content, entry.first_param, entry.second_param),
          }
        end,
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      previewer = require("telescope.previewers").new_buffer_previewer({
        define_preview = function(self, entry, status)
          -- Display only the function body in the preview window
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.body)

          -- Apply your theme to the preview buffer
          vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "cpp") -- Set filetype for syntax highlighting
          vim.api.nvim_command("colorscheme " .. vim.g.colors_name) -- Apply current theme
        end,
      }),
      attach_mappings = function(prompt_bufnr, map)
        -- On Enter, navigate to the selected line and execute Bazel command
        map("i", "<CR>", function()
          local selection = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("edit " .. selection.value.filename) -- Open the file
          vim.api.nvim_win_set_cursor(0, { selection.value.line_num, 0 }) -- Place cursor at the function definition

          local second_param = selection.value.second_param

          Run_in_terminal("bazel test --config=dbg --test_arg=--filter=" .. second_param .. " +", false, true)
        end)
        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("SelectBazelTestToExecute", list_bazel_test_instances, {})

local function list_bazel_debug_instances()
  local filename = vim.fn.expand("%:p") -- Full path of the current file
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- All lines of the current buffer
  local results = {}

  if not filename or filename == "" then
    vim.notify("No file currently open!", vim.log.levels.ERROR)
    return
  end

  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {row, col}
  local cursor_line = cursor_pos[1]

  local function extract_function_body(start_line)
    local body = {}
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      table.insert(body, content)

      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return body
  end

  local function is_cursor_inside_function(start_line)
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      if opening_braces > 0 and opening_braces > closing_braces then
        if cursor_line >= start_line and cursor_line <= i then
          return true
        end
      end

      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return false
  end

  for line_num, line_content in ipairs(lines) do
    local first_param, second_param = line_content:match("TEST.*%s*%(([^,]+)%s*,%s*([^%)]+)%)")
    if first_param and second_param then
      table.insert(results, {
        filename = filename,
        line_num = line_num,
        distance_to_cursor = math.abs(line_num - cursor_line),
        is_cursor_inside = is_cursor_inside_function(line_num),
        content = line_content,
        first_param = first_param:gsub("%s+", ""),
        second_param = second_param:gsub("%s+", ""),
        body = extract_function_body(line_num),
      })
    end
  end

  if #results == 0 then
    vim.notify("No instances of TEST_F found!", vim.log.levels.INFO)
    return
  end

  table.sort(results, function(a, b)
    if a.is_cursor_inside ~= b.is_cursor_inside then
      return a.is_cursor_inside
    else
      return a.distance_to_cursor < b.distance_to_cursor
    end
  end)

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Select Test to Debug",
      finder = require("telescope.finders").new_table({
        results = results,
        entry_maker = function(entry)
          return {
            value = entry,
            display = string.format(
              ":%d %s (%s, %s)",
              entry.line_num,
              entry.content,
              entry.first_param,
              entry.second_param
            ),
            ordinal = string.format("%s %s %s", entry.content, entry.first_param, entry.second_param),
          }
        end,
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      previewer = require("telescope.previewers").new_buffer_previewer({
        define_preview = function(self, entry, status)
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.body)
          vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "cpp")
          vim.api.nvim_command("colorscheme " .. vim.g.colors_name)
        end,
      }),
      attach_mappings = function(prompt_bufnr, map)
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        -- Debug selected test on <CR>
        map("i", "<CR>", function()
          local selection = action_state.get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)
          local second_param = selection.value.second_param

          -- Debugging configurations (using nvim-dap)
          local dap = require("dap")
          dap.run({

            name = "Debug Test: " .. second_param,
            args = { "--filter=" .. second_param },
            -- type = "cppdbg",
            type = "codelldb",
            request = "launch",
            MIMode = "gdb",
            program = function()
              local file_path = vim.fn.expand("%:p")
              local file_name = string.match(file_path, "([^/]+)$")
              file_name = Strip_file_extension(file_name)

              local original_path = vim.fn.getcwd()
                .. "/bazel-bin/src/mongo/db/modules/enterprise/src/streams/exec/tests/"
                .. file_name
              local fallback_path = vim.fn.getcwd()
                .. "/bazel-bin/src/mongo/db/modules/enterprise/src/streams/exec/tests/streams_"
                .. file_name

              if vim.fn.filereadable(original_path) == 1 then
                return original_path
              elseif vim.fn.filereadable(fallback_path) == 1 then
                return fallback_path
              else
                vim.notify(
                  "debug artifact for "
                    .. file_name
                    .. " does not exist.\n"
                    .. original_path
                    .. " not found\n"
                    .. fallback_path
                    .. " not found\n\n"
                    .. "Have you ran 'bazel test --config=dbg +{file}' yet? 'Bazel: All'",
                  vim.log.levels.ERROR
                )
                return nil
              end
            end,
            externalConsole = false,
            cwd = "/home/ubuntu/mongo/",
            stopOnEntry = false,
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
          })
        end)

        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("SelectBazelTestToDebug", list_bazel_debug_instances, {})

local function list_go_test_instances()
  -- Get the current buffer name and content
  local filename = vim.fn.expand("%:p") -- Full path of the current file
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- All lines of the current buffer
  local results = {}

  -- Check if the file is valid
  if not filename or filename == "" then
    vim.notify("No file currently open!", vim.log.levels.ERROR)
    return
  end

  -- Get the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {row, col}
  local cursor_line = cursor_pos[1]

  -- Function to extract the body of a function by tracking braces
  local function extract_function_body(start_line)
    local body = {}
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]

      -- Track braces to identify function boundaries
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      table.insert(body, content)

      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return body
  end

  -- Helper function to check if the cursor is inside the function body
  local function is_cursor_inside_function(start_line)
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]

      -- Track braces
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      -- Check if the cursor line falls within the function range
      if opening_braces > 0 and opening_braces > closing_braces then
        if cursor_line >= start_line and cursor_line <= i then
          return true
        end
      end

      -- If function boundary is reached, we exit the check
      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return false
  end

  -- Find all functions prefixed with "Test" (Go test naming convention)
  for line_num, line_content in ipairs(lines) do
    local test_name = line_content:match("^func%s+(Test%w+)%s*%(")
    if test_name then
      table.insert(results, {
        filename = filename,
        line_num = line_num,
        distance_to_cursor = math.abs(line_num - cursor_line), -- Calculate distance to cursor
        is_cursor_inside = is_cursor_inside_function(line_num), -- Check if cursor is inside this function
        content = line_content,
        test_name = test_name, -- Save the test name for execution
        body = extract_function_body(line_num), -- Extract the function body
      })
    end
  end

  -- If no tests are found, notify the user
  if #results == 0 then
    vim.notify("No test functions found!", vim.log.levels.INFO)
    return
  end

  -- Sort results prioritizing the function the cursor is inside, then functions above the cursor, and finally by distance to cursor
  table.sort(results, function(a, b)
    if a.is_cursor_inside ~= b.is_cursor_inside then
      return a.is_cursor_inside -- Prioritize functions the cursor is inside
    else
      return a.distance_to_cursor < b.distance_to_cursor -- Then sort by proximity to cursor
    end
  end)

  -- Use Telescope to list and execute Go test functions
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Select Go Test to Execute",
      finder = require("telescope.finders").new_table({
        results = results,
        entry_maker = function(entry)
          return {
            value = entry,
            display = string.format(":%d %s (%s)", entry.line_num, entry.content, entry.test_name),
            ordinal = string.format("%s %s", entry.content, entry.test_name),
          }
        end,
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      previewer = require("telescope.previewers").new_buffer_previewer({
        define_preview = function(self, entry, status)
          -- Display the function body in the preview window
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.body)
          vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "go")
        end,
      }),
      attach_mappings = function(prompt_bufnr, map)
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        -- Run the selected test function with `go test`
        map("i", "<CR>", function()
          local selection = action_state.get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)
          local test_name = selection.value.test_name

          -- Execute the selected Go test
          local cmd = string.format("go test -v -run %s %s", test_name, selection.value.filename)
          Run_in_terminal(cmd)
        end)

        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("SelectGoTest", list_go_test_instances, {})

local function list_go_debug_test_instances()
  -- Get the current buffer name and content
  local filename = vim.fn.expand("%:p") -- Full path of the current file
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- All lines of the current buffer
  local results = {}

  -- Check if the file is valid
  if not filename or filename == "" then
    vim.notify("No file currently open!", vim.log.levels.ERROR)
    return
  end

  -- Get the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {row, col}
  local cursor_line = cursor_pos[1]

  -- Function to extract the body of a function by tracking braces
  local function extract_function_body(start_line)
    local body = {}
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]

      -- Track braces to identify function boundaries
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      table.insert(body, content)

      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return body
  end

  -- Helper function to check if the cursor is inside the function body
  local function is_cursor_inside_function(start_line)
    local opening_braces = 0
    local closing_braces = 0

    for i = start_line, #lines do
      local content = lines[i]

      -- Track braces
      opening_braces = opening_braces + select(2, content:gsub("{", ""))
      closing_braces = closing_braces + select(2, content:gsub("}", ""))

      -- Check if the cursor line falls within the function range
      if opening_braces > 0 and opening_braces > closing_braces then
        if cursor_line >= start_line and cursor_line <= i then
          return true
        end
      end

      -- If function boundary is reached, we exit the check
      if opening_braces > 0 and opening_braces == closing_braces then
        break
      end
    end

    return false
  end

  -- Find all functions prefixed with "Test" (Go test naming convention)
  for line_num, line_content in ipairs(lines) do
    local test_name = line_content:match("^func%s+(Test%w+)%s*%(")
    if test_name then
      table.insert(results, {
        filename = filename,
        line_num = line_num,
        distance_to_cursor = math.abs(line_num - cursor_line), -- Calculate distance to cursor
        is_cursor_inside = is_cursor_inside_function(line_num), -- Check if cursor is inside this function
        content = line_content,
        test_name = test_name, -- Save the test name for execution
        body = extract_function_body(line_num), -- Extract the function body
      })
    end
  end

  -- If no tests are found, notify the user
  if #results == 0 then
    vim.notify("No test functions found!", vim.log.levels.INFO)
    return
  end

  -- Sort results prioritizing the function the cursor is inside, then functions above the cursor, and finally by distance to cursor
  table.sort(results, function(a, b)
    if a.is_cursor_inside ~= b.is_cursor_inside then
      return a.is_cursor_inside -- Prioritize functions the cursor is inside
    else
      return a.distance_to_cursor < b.distance_to_cursor -- Then sort by proximity to cursor
    end
  end)

  -- Use Telescope to list and execute Go test functions
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Select Go Test to Execute",
      finder = require("telescope.finders").new_table({
        results = results,
        entry_maker = function(entry)
          return {
            value = entry,
            display = string.format(":%d %s (%s)", entry.line_num, entry.content, entry.test_name),
            ordinal = string.format("%s %s", entry.content, entry.test_name),
          }
        end,
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      previewer = require("telescope.previewers").new_buffer_previewer({
        define_preview = function(self, entry, status)
          -- Display the function body in the preview window
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.body)
          vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "go")
        end,
      }),
      attach_mappings = function(prompt_bufnr, map)
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        -- Run the selected test function with `go test`
        map("i", "<CR>", function()
          local selection = action_state.get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)
          local test_name = selection.value.test_name

          -- Execute the selected Go test
          require("dap").run({
            type = "delve",
            name = "Delve: Debug Specific Go Test",
            request = "launch",
            mode = "test",
            program = vim.fn.expand("%"), -- Test current file
            args = { "-test.run", test_name }, -- Pass the test function name as an argument
          })
        end)

        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("SelectGoDebugTest", list_go_debug_test_instances, {})

local function executeCppTests()
  local commands = {
    {
      label = "Bazel: All",
      action = function()
        Run_in_terminal("bazel test --config=dbg +", false, true)
      end,
    },
    {
      label = "Bazel: Select",
      action = function()
        list_bazel_test_instances()
      end,
    },
    {
      label = "Debug: All",
      action = function()
        require("dap").run({
          name = "Launch unit test",
          -- type = "cppdbg",
          type = "codelldb",
          request = "launch",
          MIMode = "gdb",
          -- todo this configuration should really be reused
          program = function()
            local file_path = vim.fn.expand("%:p")
            local file_name = string.match(file_path, "([^/]+)$")
            file_name = Strip_file_extension(file_name)

            local original_path = vim.fn.getcwd()
              .. "/bazel-bin/src/mongo/db/modules/enterprise/src/streams/exec/tests/"
              .. file_name
            local fallback_path = vim.fn.getcwd()
              .. "/bazel-bin/src/mongo/db/modules/enterprise/src/streams/exec/tests/streams_"
              .. file_name

            if vim.fn.filereadable(original_path) == 1 then
              return original_path
            elseif vim.fn.filereadable(fallback_path) == 1 then
              return fallback_path
            else
              vim.notify(
                "debug artifact for "
                  .. file_name
                  .. " does not exist.\n"
                  .. original_path
                  .. " not found\n"
                  .. fallback_path
                  .. " not found\n\n"
                  .. "Have you ran 'bazel test --config=dbg +{file}' yet? 'Bazel: All'",
                vim.log.levels.ERROR
              )
              return nil
            end
          end,
          externalConsole = false,
          cwd = "/home/ubuntu/mongo/",
          stopOnEntry = false,
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
        })
      end,
    },
    {
      label = "Debug: Select",
      action = function()
        list_bazel_debug_instances()
      end,
    },
  }

  -- Extract labels for the selection menu
  local options = {}
  for _, cmd in ipairs(commands) do
    table.insert(options, cmd.label)
  end

  -- Use vim.ui.select for dropdown-style selection
  vim.ui.select(options, { prompt = "Configuration:" }, function(choice)
    if not choice then
      return -- User canceled the selection
    end

    -- Find the corresponding command
    for _, cmd in ipairs(commands) do
      if cmd.label == choice then
        cmd.action()
        return
      end
    end
  end)
end

local function executeJavascriptTests()
  local commands = {
    {
      label = "Launch",
      action = function()
        Run_in_terminal("test-streams-jstest ", true)
      end,
    },
    {
      label = "Connect",
      action = function()
        Run_in_terminal("test-connstring-streams ", true)
      end,
    },
    {
      label = "Select test to isolate",
      action = function()
        select_js_function_to_isolate()
        Run_in_terminal("test-streams-jstest ", true)
      end,
    },
    {
      label = "Undo test isolation",
      action = function()
        undo_test_isolation()
      end,
    },
  }

  -- Extract labels for the selection menu
  local options = {}
  for _, cmd in ipairs(commands) do
    table.insert(options, cmd.label)
  end

  -- Use vim.ui.select for dropdown-style selection
  vim.ui.select(options, { prompt = "Configuration:" }, function(choice)
    if not choice then
      return -- User canceled the selection
    end

    -- Find the corresponding command
    for _, cmd in ipairs(commands) do
      if cmd.label == choice then
        cmd.action()
        return
      end
    end
  end)
end

local function executeGoTests()
  local commands = {
    {
      label = "Test: All",
      action = function()
        vim.notify("!!! This is experiemental. I did not get this to work consistenly for all unit tests")
        vim.notify(
          "I think there is something specific we need to do to coordinate with go run cmd/buildscript/build.go"
        )
        Run_in_terminal("go test -v ", true)
      end,
    },
    {
      label = "Test: Select",
      action = function()
        vim.notify("!!! This is experiemental. I did not get this to work consistenly for all unit tests")
        vim.notify(
          "I think there is something specific we need to do to coordinate with go run cmd/buildscript/build.go"
        )
        list_go_test_instances()
      end,
    },
    {
      label = "Debug: All",
      action = function()
        require("dap").run({
          type = "delve",
          name = "Delve: Go Test",
          request = "launch",
          mode = "test",
          program = vim.fn.expand("%"), -- Test current file
        })
      end,
    },
    {
      label = "Debug: Select",
      action = function()
        list_go_debug_test_instances()
      end,
    },
  }

  -- Extract labels for the selection menu
  local options = {}
  for _, cmd in ipairs(commands) do
    table.insert(options, cmd.label)
  end

  -- Use vim.ui.select for dropdown-style selection
  vim.ui.select(options, { prompt = "Configuration:" }, function(choice)
    if not choice then
      return -- User canceled the selection
    end

    -- Find the corresponding command
    for _, cmd in ipairs(commands) do
      if cmd.label == choice then
        cmd.action()
        return
      end
    end
  end)
end

local function execute_test_based_on_filetype()
  -- Get the file type of the current buffer
  local filetype = vim.bo.filetype

  if filetype == "javascript" then
    executeJavascriptTests()
  elseif filetype == "cpp" then
    executeCppTests()
  elseif filetype == "go" then
    executeGoTests()
  else
    -- Handle other unsupported file types
    vim.notify("No test configurations set for file type: " .. filetype, vim.log.levels.INFO)
  end
end

-- Parse functions using Treesitter
function get_top_level_function_executions()
  local ts = vim.treesitter
  local parser = ts.get_parser(0, "javascript") -- Parse JavaScript
  local root = parser:parse()[1]:root()

  -- Use Tree-sitter query to capture top-level executions and IIFEs
  local query_string = [[  
;; Match top level function calls
(program
  (expression_statement  
    (call_expression  
      function: (identifier) @function_name  
      arguments: (arguments)
	)
  )
)
;; Match function calls within top level anonymous function calls
(program
  (expression_statement
    (parenthesized_expression
      (call_expression
		function: 
    		(function_expression
			  	body: 
					(statement_block
					  (expression_statement  
						(call_expression  
						  function: (identifier) @function_name  
						  arguments: (arguments)
						)
					  )
		  			)
			)
	  )
	)
  )
)
;; Match function calls within top level try blocks
(program
  (try_statement
  	body:
	  (statement_block
		  (expression_statement  
			(call_expression  
			  function: (identifier) @function_name  
			  arguments: (arguments)
			)
		  )
	  )
  )
)
;; Match function calls within top level for in loops
(program
  (for_in_statement
  	body:
	  (statement_block
		  (expression_statement  
			(call_expression  
			  function: (identifier) @function_name  
			  arguments: (arguments)
			)
		  )
	  )
  )
)
;; Match function calls within top level try catches with nested for in loops
(program
  (try_statement
  	body:
	  (statement_block
		  (for_in_statement
			body:
			  (statement_block
				  (expression_statement  
					(call_expression  
					  function: (identifier) @function_name  
					  arguments: (arguments)
					)
				  )
			  )
		  )
	  )
  )
)
  ]]
  local query = vim.treesitter.query.parse("javascript", query_string)

  local function_executions = {} -- Collect captures

  for id, node, _ in query:iter_captures(root, 0, 0, -1) do
    local function_name = vim.treesitter.get_node_text(node, 0) -- Function name

    local parent = node:parent()
    local parameters = ""
    local start_line, _, end_line, _ = parent:range()

    for child in parent:iter_children() do
      if child:type() == "arguments" then
        local args = vim.treesitter.get_node_text(child, 0)
        parameters = string.gsub(args, "[\r\n]", "")
      end
    end

    -- Store function name and its parameters
    table.insert(
      function_executions,
      { name = function_name, params = parameters, start_line = start_line + 1, end_line = end_line + 1 }
    )
  end

  return function_executions
end

-- Comment out other functions and leave the selected function
function comment_out_functions(functions_to_comment, selected_function_start_line)
  local bufnr = 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local lines_to_comment = {}

  for i, fn in ipairs(functions_to_comment) do
    if fn.start_line == selected_function_start_line then
      goto continue
    end

    for j = fn.start_line, fn.end_line do
      lines_to_comment[j] = true
    end

    ::continue::
  end

  local commented_lines = {}
  for i, line in ipairs(lines) do
    if lines_to_comment[i] then
      table.insert(commented_lines, "// __AUTO_COMMENT " .. line)
    else
      table.insert(commented_lines, line)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, commented_lines)
end

function undo_test_isolation()
  local bufnr = 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local uncommented_lines = {}

  for i, line in ipairs(lines) do
    if line:match("^// __AUTO_COMMENT") then
      local updateLine = line:gsub("^// __AUTO_COMMENT ", "")
      table.insert(uncommented_lines, updateLine)
    else
      table.insert(uncommented_lines, line)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, uncommented_lines)
end

function select_js_function_to_isolate()
  undo_test_isolation()

  local functions = get_top_level_function_executions()
  if #functions == 0 then
    print("No top-level functions found!")
    return
  end

  local cursor_line = vim.api.nvim_win_get_cursor(0)[1] -- `[row, column]`, we only need `row`

  table.sort(functions, function(a, b)
    return math.abs(a.start_line - cursor_line) < math.abs(b.start_line - cursor_line)
  end)

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Select a function call to isolate",
      finder = require("telescope.finders").new_table({
        results = functions,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.name .. "" .. entry.params,
            ordinal = entry.name .. "" .. entry.params,
            start_line = entry.start_line,
            end_line = entry.end_line,
          }
        end,
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr, map)
        local actions = require("telescope.actions")
        local state = require("telescope.actions.state")

        map("i", "<CR>", function()
          local selection = state.get_selected_entry()
          actions.close(prompt_bufnr)
          if selection then
            vim.api.nvim_win_set_cursor(0, { selection.start_line, 0 })
            comment_out_functions(functions, selection.start_line)
          end
        end)

        return true
      end,
    })
    :find()
end

-- Create a keybinding for quick execution
vim.api.nvim_create_user_command("ExecuteTests", execute_test_based_on_filetype, {})
vim.keymap.set("n", "<leader>tt", "<cmd>ExecuteTests<CR>", { desc = "Execute tests" })
