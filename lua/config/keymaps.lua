-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>w", vim.cmd.w)
keymap.set("n", "<leader>q", vim.cmd.q)

--move code lines
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

--tmux move
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")

--lsp
keymap.set("n", "<leader>;", function()
  vim.lsp.buf.hover()
end)
keymap.set("n", "<leader>rv", function()
  vim.lsp.buf.rename()
end)

--select all
keymap.set("n", "<C-a>", "gg<S-v>G")

--fugitive
keymap.set("n", "<leader>gg", vim.cmd.Git)

--vim - go
keymap.set("n", "<leader>gc", vim.cmd.GoCoverage)
keymap.set("n", "<leader>gb", vim.cmd.GoBuild)
keymap.set("n", "<leader>gt", vim.cmd.GoTest)
keymap.set("n", "<leader>ga", vim.cmd.GoAlternate)
