local nmap = function(keymap, action, opts)
    vim.keymap.set('n', keymap, action, opts)
end

nmap('<leader>e', function()
    vim.cmd('20Lex')
end, { desc = "File explorer" })
