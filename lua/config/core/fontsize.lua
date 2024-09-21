Font = "3270 Nerd Font Mono"
DefaultFontSize = 16
FontSize = DefaultFontSize

vim.opt.guifont = Font .. ":h" .. FontSize

function ChangeFontSize(delta)
	FontSize = FontSize + delta
	vim.opt.guifont = Font .. ":h" .. FontSize
end

function ResetFontSize()
	FontSize = DefaultFontSize
	vim.opt.guifont = Font .. ":h" .. DefaultFontSize
end

vim.keymap.set("n", "<C-=>", function()
	ChangeFontSize(1)
end, { desc = "Increase font size by 1" })
vim.keymap.set("n", "<C-ScrollWheelUp>", function()
	ChangeFontSize(1)
end, { desc = "Increase font size by 1" })
vim.keymap.set("n", "<C-ScrollWheelDown>", function()
	ChangeFontSize(-1)
end, { desc = "Decrease font size by 1" })
vim.keymap.set("n", "<C-0>", ResetFontSize, { desc = "Reset Font Size" })
