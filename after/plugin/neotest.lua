require("neotest").setup({
  adapters = {
    require("neotest-python")({
        runner = "pytest",
    })
  }
})

vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end)
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>to", function() require("neotest").output.open() end)

--coverage
require("coverage").setup({})
vim.keymap.set("n", "<leader>lc", vim.cmd.Coverage)
