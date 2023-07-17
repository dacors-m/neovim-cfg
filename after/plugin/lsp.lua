local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
    'gopls'
})

lsp.setup()

vim.keymap.set("n", "<leader>rv", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>;", function() vim.lsp.buf.hover() end)
