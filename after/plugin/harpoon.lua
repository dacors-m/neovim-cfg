local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)


vim.keymap.set("n", "<C-k>", function() ui.nav_next() end) 
vim.keymap.set("n", "<C-j>", function() ui.nav_prev() end) 
