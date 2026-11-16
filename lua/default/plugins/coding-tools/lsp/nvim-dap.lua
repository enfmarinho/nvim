return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- UI 
			dapui.setup()
			require("nvim-dap-virtual-text").setup({})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
			vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "DiagnosticInfo" })
			vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })

			-- Adapters
			local codelldb = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb,
					args = { "--port", "${port}" },
				},
			}

			-- Configurations
			local function pick_executable()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end

			local native = {
				{
					name = "Launch executable",
					type = "codelldb",
					request = "launch",
					program = pick_executable,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = function()
						local input = vim.fn.input("Args: ")
						return vim.split(input, " ", { trimempty = true })
					end,
				},
				{
					name = "Attach to process",
					type = "codelldb",
					request = "attach",
					pid = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
			dap.configurations.c = native
			dap.configurations.cpp = native
			dap.configurations.rust = dap.configurations.rust or native

			-- Keymaps 
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			map("<leader>db", dap.toggle_breakpoint, "Toggle breakpoint")
			map("<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Condition: "))
			end, "Conditional breakpoint")
			map("<leader>dl", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
			end, "Log point")
			map("<leader>dr", function()
				if vim.bo.filetype == "rust" and not dap.session() then
					vim.cmd.RustLsp("debuggables")
				else
					dap.continue()
				end
			end, "Start / continue debugging")
			map("<leader>dn", dap.step_over, "Step over")
			map("<leader>ds", dap.step_into, "Step into")
			map("<leader>do", dap.step_out, "Step out")
			map("<leader>dR", dap.run_last, "Run last")
			map("<leader>dc", dap.terminate, "Terminate")
			map("<leader>du", dapui.toggle, "Toggle debugger UI")
			map("<leader>dp", dap.repl.toggle, "Toggle REPL")
			vim.keymap.set({ "n", "v" }, "<leader>de", function()
				dapui.eval()
			end, { desc = "Evaluate expression" })
		end,
	},
}
