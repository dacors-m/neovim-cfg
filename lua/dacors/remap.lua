vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("n", "<leader>q", "<cmd>:q!<CR>")

vim.keymap.set("v", "J",":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K",":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>y", "\"+y")

--tmux move
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")


--term
vim.keymap.set("n", "<leader>t", "<cmd>FloatermNew<CR>")
