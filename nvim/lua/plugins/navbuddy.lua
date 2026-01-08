return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = function()
    local actions = require("nvim-navbuddy.actions")

    return {
      lsp = { auto_attach = true },

      mappings = {
        ["<Left>"] = actions.parent(), -- Move to left panel
        ["<Right>"] = actions.children(), -- Move to right panel
      },

      use_default_mappings = true,
    }
  end,
  keys = {
    { "<leader>n", "<cmd>Navbuddy<CR>", desc = "Open Navbuddy" },
  },
}
