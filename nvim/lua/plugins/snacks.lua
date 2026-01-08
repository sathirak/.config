return {
  {
    "snacks.nvim",
    ---@type snacks.picker.explorer.Config ee. e:Quit
    keys = {
      { "<leader>n", false },
      {
        "<leader>gi",
        function()
          Snacks.picker.gh_issue()
        end,
        desc = "GitHub Issues (open)",
      },
      {
        "<leader>gI",
        function()
          Snacks.picker.gh_issue({ state = "all" })
        end,
        desc = "GitHub Issues (all)",
      },
      {
        "<leader>gp",
        function()
          Snacks.picker.gh_pr()
        end,
        desc = "GitHub Pull Requests (open)",
      },
      {
        "<leader>gP",
        function()
          Snacks.picker.gh_pr({ state = "all" })
        end,
        desc = "GitHub Pull Requests (all)",
      },
    },
    opts = {
      gh = {
        -- your gh configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        git_status = false,
        hidden = true,
        ignored = true,
        exclude = { "**/.git", "**/.git/**", "**/.DS_Store" },
        sources = {
          explorer = {
            git_status = false,
            hidden = true,
            ignored = true,
            exclude = { "**/.git", "**/.git/**", "**/.DS_Store" },
            layout = {
              layout = {
                width = 25,
              },
            },
          },
        },
      },
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
⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                                   intelligence simplified.                     ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { hidden = true, icon = " ",  key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
            { hidden = true, icon = " ",  key = "n", desc = "New File",        action = ":ene | startinsert" },
            { hidden = true, icon = " ",  key = "g", desc = "Find Text",       action = ":lua Snacks.dashboard.pick('live_grep')" },
            { hidden = true, icon = " ",  key = "r", desc = "Recent Files",    action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { hidden = true, icon = " ",   key = "s", desc = "Restore Session", section = "session" },
            { hidden = true, icon = " ",  key = "q", desc = "Quit",            action = ":qa" },
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
          -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
          -- {
          --   icon = " ",
          --   title = "Browse Repo",
          --   padding = 2,
          --   key = "b",
          --   action = function()
          --     Snacks.gitbrowse()
          --   end,
          -- },
        },
      },
    },
  },
}
