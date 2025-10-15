return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      local function hl_color(name, attr)
        local hl = vim.api.nvim_get_hl(0, { name = name })
        if hl and hl[attr] then
          return string.format("#%06x", hl[attr])
        end
      end

      -- Pull colors dynamically from your current theme
      local mode_colors = {
        n = hl_color("Number", "fg") or "#7aa2f7", -- Normal
        i = hl_color("Statement", "fg") or "#9ece6a", -- Insert
        v = hl_color("Special", "fg") or "#bb9af7", -- Visual
        V = hl_color("Type", "fg") or "#bb9af7",
        [""] = hl_color("Type", "fg") or "#bb9af7",
        c = hl_color("Function", "fg") or "#e0af68", -- Command
        R = hl_color("Error", "fg") or "#f7768e", -- Replace
        t = hl_color("Number", "fg") or "#7dcfff", -- Terminal
      }

      -- Custom mode component with dynamic background
      local function mode_component()
        return {
          "mode",
          icon = " ",
          fmt = function(str)
            return " " .. str .. " "
          end,
          color = function()
            local mode = vim.fn.mode()
            return { fg = "#ffffff", bg = mode_colors[mode] or hl_color("Normal", "bg") or "#444444", gui = "bold" }
          end,
          padding = { left = 4, right = 4 },
        }
      end

      local opts = {
        options = {
          theme = "auto",
          component_separators = { left = " > ", right = "< " },
          section_separators = { left = " ", right = " " },
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = { mode_component() },
          lualine_b = {
            {
              "branch",
              icon = " ",
              color = { fg = "#000000", bg = "none" },
            },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
            },
          },
          lualine_x = {
            Snacks.profiler.status(),
          -- stylua: ignore

            {
              "diff",
              symbols = {
                added = " ",
                modified = " ",
                removed = " ",
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {},
          lualine_z = {
            {
              function()
                return " " .. os.date("%R")
              end,
              color = { fg = "#ffffff", bg = "#000000" }, -- white text on black background
            },
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      -- do not add trouble symbols if aerial is enabled
      -- And allow it to be overriden for some buffer types (see autocmds)
      if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
        local trouble = require("trouble")
        local symbols = trouble.statusline({
          mode = "symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          hl_group = "lualine_c_normal",
        })
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end

      return opts
    end,
  },
}
