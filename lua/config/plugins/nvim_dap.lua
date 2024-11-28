local function vmap(lhs, rhs, opts)
	vim.keymap.set("v", lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
	vim.keymap.set("n", lhs, rhs, opts)
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		-- NOTE: DAP
		local dap = require("dap")
		nmap("<leader>dq", function()
			dap.close()
		end)
		nmap("<leader>dc", function()
			dap.continue()
		end)
		nmap("<leader>dn", function()
			dap.step_over()
		end)
		nmap("<leader>dsi", function()
			dap.step_into()
		end)
		nmap("<leader>dso", function()
			dap.step_out()
		end)
		nmap("<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		nmap("<Leader>B", function()
			dap.set_breakpoint()
		end)
		nmap("<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		nmap("<Leader>dr", function()
			dap.repl.open()
		end)
		nmap("<Leader>dl", function()
			dap.run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		nmap("<Leader>dw", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)
		nmap("<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)

		-- NOTE: DAP-Python
		local dap_python = require("dap-python")
		dap_python.setup("python")

		nmap("<leader>dm", ":lua require('dap-python').test_method()<CR>", { desc = "[D]ebug [M]ethod" })
		nmap("<leader>df", ":lua require('dap-python').test_class()<CR>", { desc = "[D]ebug [F]ile" })
		vmap("<leader>dvs", "<ESC>:lua require('dap-python').debug_selection()<CR>", { desc = "[D]ebug [S]election" })

		-- NOTE: DAP-UI
		local dapui = require("dapui")
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- NOTE: DAP-VIRTUAL-TEXT
		require("nvim-dap-virtual-text").setup({
			show_stop_reason = false,
		})
	end,
}
