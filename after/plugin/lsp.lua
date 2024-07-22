local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_,_)
    vim.keymap.set("n", "<leader>rv", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>;", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
end

lspconfig.pyright.setup{
    capabilites = capabilities,
    on_attach = on_attach,
    settings = {
        python= {
            analysis = {
                typeCheckingMode = "off",
            }
        }
    }
}

lspconfig.gopls.setup{
    capabilites = capabilities,
    on_attach = on_attach,
    settings = {
        gopls= {
            usePlaceholders = true,
        }
    }
}


