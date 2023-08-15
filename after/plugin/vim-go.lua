vim.keymap.set('n', '<leader>gc', vim.cmd.GoCoverage)
vim.keymap.set('n', '<leader>ga', function()
    vim.cmd('vsplit')
    vim.cmd('GoAlternate')
end)
vim.keymap.set('n', '<leader>gi', vim.cmd.GoImplements)
vim.keymap.set('n', '<leader>gr', vim.cmd.GoReferrers)
vim.keymap.set('n', '<leader>gt', vim.cmd.GoTest)