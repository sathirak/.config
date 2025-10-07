return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- This ensures the colorscheme loads early to prevent a flash of the default theme.
    opts = {
      flavour = "mocha", -- You can change this to 'latte', 'frappe', or 'macchiato'
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      -- add other options here
    },
  },
}
