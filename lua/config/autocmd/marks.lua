local M = {
	group = vim.api.nvim_create_augroup("automarks", { clear = true }),
}

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.lua" },
	group = M.group,
	command = "normal mL",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.py" },
	group = M.group,
	command = "normal mP",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.md" },
	group = M.group,
	command = "normal mM",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*.xml" },
	group = M.group,
	command = "normal mX",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "**/test/*.py" },
	group = M.group,
	command = "normal mT",
})

return M
