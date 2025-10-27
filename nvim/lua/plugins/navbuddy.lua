return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = { auto_attach = true },
  },
  keys = {
    -- Change <leader>n to <leader>nb or any unused key combo
    { "<leader>n", "<cmd>Navbuddy<CR>", desc = "Open Navbuddy" },
  },
}
