vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", "<cmd>:q!<CR>")

vim.keymap.set("n", "<tab>","<C-W>w") 

vim.keymap.set("v", "J",":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K",":m '<-2<CR>gv=gv") 

vim.keymap.set("v", "<leader>y", "\"+y") 
vim.keymap.set("n", "<leader>x", "<cmd>:10sp term://zsh<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
