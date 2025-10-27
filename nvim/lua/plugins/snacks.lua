return {
  {
    "snacks.nvim",
    ---@type snacks.Config ee. e:q
    opts = {

      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⣤⣤⣤⣤⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡟⠛⠛⠛⠛⠛⠿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠘⣿⣿⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⣀⡀⠀⢀⣀⣠⣤⣄⣀⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⢿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⢠⣿⣿⠀⠀⠀⠀⢀⣴⣿⠟⠛⠛⠛⠿⣿⣦⡀⠀⠀⠀⠀⣿⣧⣴⠿⠛⠛⠛⠛⢿⣿⣦⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⠃⠘⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣇⣀⣀⣀⣀⣀⣴⣿⡿⠃⠀⠀⠀⢀⣿⣿⠁⠀⠀⠀⠀⠀⠸⣿⣷⠀⠀⠀⠀⣿⣿⠏⠀⠀⠀⠀⠀⠀⢻⣿⡆⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠃⠀⠀⠸⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠿⠿⠿⢿⣿⣏⠁⠀⠀⠀⠀⠀⢸⣿⣧⣤⣤⣤⣤⣤⣤⣤⣿⣿⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⠃⠀⠀⠀⠀⠙⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠻⣿⣧⠀⠀⠀⠀⠀⢸⣿⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠁⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠹⣿⣷⡀⠀⠀⠀⠘⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀
⠀⠀⠀⢀⣠⣴⣾⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣶⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠘⣿⣿⣄⠀⠀⠀⠘⢿⣿⣦⣤⣀⣀⣠⣤⣴⡆⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀
⠀⢰⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠘⠛⠃⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠂⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠛⠉⠁⠀⠀⠀⠀⠛⠛⠀⠀⠀⠀⠀⠀⠀⠘⠛⠃⠀⠀
⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ",  key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ",  key = "n", desc = "New File",        action = ":ene | startinsert" },
            { icon = " ",  key = "g", desc = "Find Text",       action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ",  key = "r", desc = "Recent Files",    action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {icon = " ",   key = "s", desc = "Restore Session", section = "session" },
            { icon = " ",  key = "q", desc = "Quit",            action = ":qa" },
          },
        },
        sections = {
          {
            section = "header",
            height = 15,
            padding = 2,
          },
          {
            pane = 2,
            { section = "keys", gap = 1, padding = { 0, 0 }, indent = 0, width = 5 },
          },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
          {
            icon = " ",
            title = "Browse Repo",
            padding = 2,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
        },
      },
    },
  },
}
