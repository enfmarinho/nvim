return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mrcjkb/rustaceanvim",
		"alfaix/neotest-gtest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("rustaceanvim.neotest"),
				require("neotest-gtest").setup({}),
			},
			status = { virtual_text = true },
			output = { open_on_run = false },
			quickfix = { open = false },
		})

		local nt = require("neotest")
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { desc = desc })
		end

		map("<leader>ur", function()
			nt.run.run()
		end, "Test: run nearest")

		map("<leader>uf", function()
			nt.run.run(vim.fn.expand("%"))
		end, "Test: run file")

		map("<leader>ua", function()
			nt.run.run(vim.uv.cwd())
		end, "Test: run all")

		map("<leader>ul", function()
			nt.run.run_last()
		end, "Test: run last")

		map("<leader>ud", function()
			nt.run.run({ strategy = "dap" })
		end, "Test: debug nearest")

		map("<leader>ux", function()
			nt.run.stop()
		end, "Test: stop")

		map("<leader>us", function()
			nt.summary.toggle()
		end, "Test: toggle summary")

		map("<leader>uo", function()
			nt.output.open({ enter = true, auto_close = true })
		end, "Test: show output")

		map("<leader>uO", function()
			nt.output_panel.toggle()
		end, "Test: toggle output panel")

		map("<leader>un", function()
			nt.jump.next({ status = "failed" })
		end, "Test: next failed")

		map("<leader>up", function()
			nt.jump.prev({ status = "failed" })
		end, "Test: previous failed")
	end,
}
