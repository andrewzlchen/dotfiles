vim.api.nvim_create_user_command("W", "w", {})

local M = {}
function M.openOnGithub(branch)
  local opts = {
    open = function(url)
      vim.notify(url)
      vim.fn.setreg("+", url)
      vim.notify("Yanked url to clipboard")
    end,
  }

  if not (branch == "" or branch == nil) then
    opts.branch = branch
  end
  Snacks.gitbrowse.open(opts)
end

vim.api.nvim_create_user_command("Gbrowse", function(opts)
  M.openOnGithub(opts.fargs[1])
end, { nargs = 1 })
