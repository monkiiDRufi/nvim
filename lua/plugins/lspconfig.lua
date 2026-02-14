return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", config = true },
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = {
			stylua = {},
			clangd = {},
			ruff = {
				init_options = {
					configuration = "C:/users/ruben/Documents/ruff.toml",
				},
			},
			basedpyright = {},
			ts_ls = {},
			marksman = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
						format = { default_config = { columnWidth = 99 } },
					},
				},
			},
		}

		require("mason").setup()

		for name, server in pairs(servers) do
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end,
}
