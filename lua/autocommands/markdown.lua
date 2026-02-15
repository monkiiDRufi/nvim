local browser = "zen"
local make_open_md = function(file)
    vim.cmd("make")
    vim.fn.jobstart({ browser, file }, { detach = true })
end

local open_markdown_file = function()
    vim.cmd("compiler markdown")
    local pdf_file = vim.fn.expand("%:p:r") .. ".pdf"
    make_open_md(pdf_file)
end

local open_novel = function()
    vim.cmd("compiler novel")
    make_open_md("novel.pdf")
end

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.md',
    callback = function()
        vim.cmd("compiler markdown")

        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.textwidth = 100
        vim.keymap.set("n", "<leader>of", open_markdown_file, { desc = "open markdown pdf", buffer = true })
        vim.keymap.set("n", "<leader>on", open_novel, { desc = 'open novel', buffer = true })
        vim.keymap.set("n", "<leader>b", "mplB2i*<Esc>E2a*<Esc>`p2l", { desc = 'bold', buffer = true })
    end,
})
