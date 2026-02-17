-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Override <space>n for Navbuddy (LazyVim default uses it for notifications)
-- Use Lua require so the plugin loads on first use (lazy-loaded)
vim.keymap.set("n", "<leader>n", function()
  require("nvim-navbuddy").open()
end, { desc = "Navbuddy" })
