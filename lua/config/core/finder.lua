vim.opt.wildmenu = true
vim.opt.autochdir = true

local home = vim.fn.expand("~")
local project_root = home .. "/Documents/101_programming/python"
local config_root = home .. "/AppData/Local/nvim"

vim.opt.path = {
	".",
	project_root .. "/tools",
	project_root .. "/pinattsu",
	project_root, project_root .. "/**",
	config_root, config_root .. "/**",
}
vim.opt.wildignore = {
	".git/*",
	"**/Lib/*",
	"**/venv/*",
	"**/__pycache__/*",
	"**/node_modules/*",
}

vim.api.nvim_set_keymap("n", "<leader>sf", ":find ", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sw", ":vimgrep /<C-R><C-W>/gj " .. project_root .. "/**/*.py<CR>:copen<CR>",
	{ noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sg", ":vimgrep //g " .. project_root .. "/**/*.py<C-f>^^Wa", { noremap = true })

vim.api.nvim_create_user_command("PythonTools", "cd " .. project_root, {})
vim.api.nvim_create_user_command("Config", "cd " .. config_root, {})
