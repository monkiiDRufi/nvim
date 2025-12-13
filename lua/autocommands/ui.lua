vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing spaces',
  callback = function()
    vim.cmd([[
      silent! %s/\s\+$//
    ]])
  end,
})
