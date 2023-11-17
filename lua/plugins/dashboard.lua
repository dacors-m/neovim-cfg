return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      
██████╗  █████╗  ██████╗ ██████╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║  ██║███████║██║     ██║   ██║██████╔╝███████╗
██║  ██║██╔══██║██║     ██║   ██║██╔══██╗╚════██║
██████╔╝██║  ██║╚██████╗╚██████╔╝██║  ██║███████║
╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
                                                 
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n"
      opts.config.header = vim.split(logo, "\n")

      opts.config.center = {
        {
          action = "Telescope find_files",
          desc = " Find file",
          icon = "󰱼",
          key = "f",
        },
        {
          action = function()
            return vim.cmd.Git()
          end,
          desc = " Git",
          icon = " ",
          key = "g",
        },
        {
          action = [[lua require("lazyvim.util").telescope.config_files()()]],
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = "qa",
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      }

      opts.config.footer = function()
        return { "⚡ The magic you are looking for is in the work you are avoiding ⚡" }
      end
    end,
  },
}
