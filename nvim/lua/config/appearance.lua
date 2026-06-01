local M = {}

M.state_path = vim.fn.stdpath("state") .. "/appearance-theme"

function M.read_state()
  if vim.fn.filereadable(M.state_path) ~= 1 then
    return nil
  end
  local line = vim.fn.readfile(M.state_path)[1]
  if line == "dawnfox" or line == "carbonfox" then
    return line
  end
  return nil
end

return M
