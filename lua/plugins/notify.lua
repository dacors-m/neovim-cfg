return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 300,
      fps = 100,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
}
