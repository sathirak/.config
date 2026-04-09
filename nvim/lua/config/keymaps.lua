-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Override <space>n for Navbuddy (LazyVim default uses it for notifications)
-- Use Lua require so the plugin loads on first use (lazy-loaded)
vim.keymap.set("n", "<leader>n", function()
  require("nvim-navbuddy").open()
end, { desc = "Navbuddy" })

-- Cycle through nightfox styles (carbonfox, terafox, nightfox, dayfox, dawnfox, duskfox, nordfox)
local fox_styles = { "carbonfox", "terafox", "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox" }
vim.keymap.set("n", "<leader>ut", function()
  local current = vim.g.colors_name or "carbonfox"
  local idx = 1
  for i, name in ipairs(fox_styles) do
    if name == current then idx = i break end
  end
  idx = (idx % #fox_styles) + 1
  local next_style = fox_styles[idx]
  vim.cmd.colorscheme(next_style)
  vim.notify("Colorscheme: " .. next_style, vim.log.levels.INFO, { title = "Nightfox" })
end, { desc = "Cycle fox colorscheme" })
