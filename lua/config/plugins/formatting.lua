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
			python = { "isort", "black" },
		},
		formatters = {
			isort = {
				include_trailing_comma = true,
				command = "isort",
				args = {
					"--line-length",
					"99",
					"--lines-after-import",
					"2",
					"--quiet",
					"-",
				},
			},
			black = {
				command = "black",
				args = {
					"--line-length",
					"99",
					"--quiet",
					"-",
				},
			},
		},
	},
}
