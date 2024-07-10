local lsp = require('lsp-zero')
lsp.preset('recommended')

vim.keymap.set("n", "<leader>rv", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>;", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)

local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

require('mason').setup({})

local lspconfig = require('lspconfig')

lspconfig.pyright.setup{
    settings = {
        python= {
            analysis = {
                typeCheckingMode = "off",
            }
        }
    }
}


