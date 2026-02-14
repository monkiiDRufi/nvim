require("config.core.options")
require("config.core.dependencies").install()
require("config.core.keymaps")
require("config.core.fontsize")
require("config.core.format")
require("config.core.finder")

require("config.autocmd.miscelanea")
require("config.autocmd.lsp")
require("config.autocmd.marks")

require("lazy").setup({
	{ import = "plugins.completions" },
	{ import = "plugins.git" },
	{ import = "plugins.gruvbox" },
	{ import = "plugins.tokyonight" },
	{ import = "plugins.lspconfig" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.nvim_dap" },
})

vim.cmd([[colorscheme tokyonight]])
