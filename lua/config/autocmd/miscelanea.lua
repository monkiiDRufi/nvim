vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing whitespaces on save",
	group = vim.api.nvim_create_augroup("trailing-white-spaces", { clear = true }),
	command = ":%s/\\ \\+$//e",
})
