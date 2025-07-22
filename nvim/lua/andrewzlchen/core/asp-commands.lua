function Strip_file_extension(file_name)
  local dot_index = file_name:match(".*()%.")
  if not dot_index then
    return file_name
  end
  return file_name:sub(1, dot_index - 1)
end

local term_bufnr = nil
function Run_in_terminal(command, includeFilePath, includeFileName)
  local file_path = vim.fn.expand("%:p")

  if file_path == "" and includeFilePath then
    print("No file is currently selected!")
    return
  end

  if term_bufnr == nil then
    vim.cmd.vsplit() -- Split the window vertically
    vim.cmd.term() -- Open a terminal in the new split
    term_bufnr = vim.api.nvim_get_current_buf()
  end

  local job_id = vim.bo[term_bufnr].channel
  local full_command = command
  if includeFilePath then
    full_command = full_command .. "" .. file_path
  end
  if includeFileName then
    local file_name = string.match(file_path, "([^/]+)$")
    file_name = Strip_file_extension(file_name)
    full_command = full_command .. "" .. file_name
  end
  full_command = full_command .. "\r\n"
  vim.fn.chansend(job_id, full_command)

  vim.cmd("startinsert")
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>mb",
  "<cmd>lua Run_in_terminal('s-mongo-build')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-build" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ms",
  "<cmd>lua Run_in_terminal('s-mongo-start')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-start" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>me",
  "<cmd>lua Run_in_terminal('s-mongo-shell')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-shell" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mk",
  "<cmd>lua Run_in_terminal('s-mongo-kill')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-kill" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mc",
  "<cmd>lua Run_in_terminal('s-mongo-clean')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-clean" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mr",
  "<cmd>lua Run_in_terminal('s-mongo-release')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-release" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ml",
  "<cmd>lua Run_in_terminal('s-mongo-logs')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-logs" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mo",
  "<cmd>lua Run_in_terminal('s-mongo-compilecommands')<CR>",
  { noremap = true, silent = true, desc = "s-mongo-compilecommands" }
)
