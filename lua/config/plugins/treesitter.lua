return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local install = require("nvim-treesitter.install")
		install.prefer_git = true
		install.compilers = { "clang", "gcc" }

		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "html" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		-- Folding with treesitter!
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
}
