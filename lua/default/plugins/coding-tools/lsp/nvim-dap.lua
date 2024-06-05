return {
	{
		"mfussenegger/nvim-dap",
		enabled = false,
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Add a breakpoint" })
			vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Run debugger" })
			vim.keymap.set("n", "<leader>ds", "<cmd> DapStepInto <cr>", { desc = "Step into" })
			vim.keymap.set("n", "<leader>dn", "<cmd> DapStepOver <cr>", { desc = "Step over" })
			vim.keymap.set("n", "<leader>dc", "<cmd> DapTerminate <cr>", { desc = "End execution" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		enabled = false,
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
