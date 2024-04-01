return {

  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false,
    init = function()
      local theme = require("catppuccin")
      theme.setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        compile = {
          enable = true,
          compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
          suffix = "_compiled",
        },
        color_overrides = {
          mocha = {
            base = "#11111b",
          },
        },
        custom_highlights = function(colors)
          return {
            WinSeparator = { fg = colors.lavender },
          }
        end,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    lazy = false,
    init = function()
      local theme = require("tokyonight")
      theme.setup({
        style = "night", -- "day" or "night"
        on_highlights = function(hl, c)
          hl.WinSeparator = { fg = c.blue }
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      priority = 1000,
    },
  },
}
