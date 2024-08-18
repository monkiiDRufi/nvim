vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Define markdown snippets on enter .md files",
	pattern = "*.md",
	group = vim.api.nvim_create_augroup("markdown_snippets", { clear = true }),
	callback = function()
		vim.keymap.set("n", "<leader>o", ':!chrome "%:p"<CR>', { desc = "[O]pen in [W]ebrowser" })
		print("Loaded markdown snippets")
	end,
})

-- vim: ts=2 sts=2 sw=2 et
