return {
  "EdenEast/nightfox.nvim",
  opts = {
    palettes = {
      carbonfox = {
        bg0 = "#0D0D0D",
        bg1 = "#0D0D0D",
      },
    },
    specs = {
      carbonfox = {},
    },
  },

  {
    "LazyVim/LazyVim",
    opts = function()
      -- Time-based colorscheme for Colombo, Sri Lanka
      -- dawnfox (light) from 00:00 to 12:00
      -- carbonfox (dark) from 12:00 to 24:00
      local function get_time_colorscheme()
        local hour = tonumber(os.date("%H"))
        return (hour >= 0 and hour < 12) and "dawnfox" or "carbonfox"
      end

      return {
        colorscheme = "carbonfox",
      }
    end,
  },
}
