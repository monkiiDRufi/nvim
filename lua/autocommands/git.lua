vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = tonumber(vim.fn.line('.'))
  if not line_number or line_number < 1 then
    vim.notify('Invalid line number', vim.log.levels.ERROR)
    return
  end
  local filename = vim.api.nvim_buf_get_name(0)
  if filename == '' then
    vim.notify('Cannot get filename', vim.log.levels.ERROR)
    return
  end
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })
