vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.lua',
    callback = function()
        vim.lsp.enable('lua_ls')
    end,
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.py',
    callback = function()
        vim.lsp.enable('basedpyright')
    end,
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.cs',
    callback = function()
        vim.lsp.enable('csharp_ls')
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('LspOnAttach', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method('textDocument/hover') then
            vim.keymap.set("i", "(", function()
                vim.lsp.buf.hover()
                return "("
            end, { expr = true, buffer = args.buf })
        end

        -- Completion on triggerCharacters
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        -- Format on save
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('LspOnAttach', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end

        if client:supports_method('textDocument/definition') then
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
            vim.keymap.set('n', 'grr', vim.lsp.buf.references, { desc = "[G]o [R]efe[r]ences" })
            vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = "[G]o [R]e[N]ame" })
            vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { desc = "[G]o [C]ode [A]ction" })
        end
    end,
})
