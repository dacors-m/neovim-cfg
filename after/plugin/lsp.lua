local lsp = require('lsp-zero')
lsp.preset('recommended')

vim.keymap.set("n", "<leader>rv", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>;", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)

local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

require('mason').setup({})
local masonlsp = require('mason-lspconfig')
masonlsp.setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'gopls', 'pyright'},
    handlers = {
      lsp.default_setup,
    },
})

