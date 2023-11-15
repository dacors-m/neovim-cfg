return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_z = {
        {
          "datetime",
          style = "%Y-%b-%w %I:%M %p",
        },
      },
    },
  },
}
