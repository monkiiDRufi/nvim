local nmap = function(keymap, action, opts)
    vim.keymap.set('n', keymap, action, opts)
end

nmap('<leader>e', function()
    vim.cmd('silent Lex')
    vim.cmd('vertical resize 40')
end, { desc = "File explorer" })
