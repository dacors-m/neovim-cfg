return {

  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false,
    config = function()
      local theme = require("catppuccin")
      theme.setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        custom_highlights = function(colors)
          return {
            WinSeparator = { fg = colors.blue },
          }
        end,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    lazy = false,
    config = function()
      local theme = require("tokyonight")
      theme.setup({
        style = "night", -- "day" or "night"
        on_highlights = function(hl, c)
          hl.WinSeparator = { fg = c.cyan, bg = c.blue }
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
