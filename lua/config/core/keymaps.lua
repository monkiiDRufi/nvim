-- toggle hlsearch
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- quickfix
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic quickfix list" })

-- terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

ToggleTerm = {
	direction = "horizontal",
	_getToggleCmd = function(self)
		if self.direction == "horizontal" then
			return "split"
		end
		if self.direction == "vertical" then
			return "vsplit"
		end
	end,
	toggle = function(self)
		if not self._tbufnr then
			vim.cmd(self:_getToggleCmd() .. "|terminal")
			self._tbufnr = vim.fn.bufnr("%")
			self._open_terminal = true
			return
		end

		if not self._open_terminal then
			vim.cmd(self:_getToggleCmd() .. "|b" .. self._tbufnr)
		else
			vim.cmd("q")
		end
		self._open_terminal = not self._open_terminal
	end,
}

vim.keymap.set("n", "<leader>t", function()
	ToggleTerm:toggle()
end, { desc = "[T]oggle Terminal" })

-- movement
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Miscelanea
vim.keymap.set("n", "<leader>fy", ":let @*=expand('%:p')<CR>", { desc = "[F]ile [Y]ank" })
