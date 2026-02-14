vim.opt.wildmenu = true

local home = vim.fn.expand("~")
local python_scripts = home .. "/Documents/101_programming/python"
local nvim_config = vim.fn.stdpath('config')

vim.opt.path = {
	".",
	python_scripts .. "/tools",
	python_scripts .. "/pinattsu",
	python_scripts, python_scripts .. "/**",
	nvim_config, nvim_config .. "/**",
}
vim.opt.wildignore = {
	".git/*",
	"**/Lib/*",
	"**/venv/*",
	"**/__pycache__/*",
	"**/node_modules/*",
}

vim.api.nvim_set_keymap("n", "<leader>sf", ":find ", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sw", ":vimgrep /<C-R><C-W>/gj " .. python_scripts .. "/**/*.py<CR>:copen<CR>",
	{ noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sg", ":vimgrep //g " .. python_scripts .. "/**/*.py<C-f>^^Wa", { noremap = true })

vim.api.nvim_create_user_command("PythonTools", "cd " .. python_scripts, {})
vim.api.nvim_create_user_command("Config", "cd " .. nvim_config, {})
