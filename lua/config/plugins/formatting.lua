return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = {
			timeout = 500,
			lsp_fallback = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
		},
	},
}
