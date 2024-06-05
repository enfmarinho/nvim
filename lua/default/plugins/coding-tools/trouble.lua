return {
	"folke/trouble.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup({
			position = "bottom",
			height = 8,
			width = 50,
			icons = true,
			mode = "workspace_diagnostics",
			severity = nil,
			fold_open = "",
			fold_closed = "",
			group = true,
			padding = false,
			cycle_results = true,
			action_keys = {
				close = "q",
				cancel = "<esc>",
				refresh = "r",
				jump = { "<cr>", "<2-leftmouse>" },
				open_split = { "<c-x>" },
				open_vsplit = { "<c-v>" },
				open_tab = { "<c-t>" },
				jump_close = { "<tab>" },
				toggle_mode = "m",
				switch_severity = "s",
				toggle_preview = "P",
				hover = "K",
				preview = "p",
				open_code_href = {},
				close_folds = { "c" },
				open_folds = { "o" },
				toggle_fold = {},
				previous = "k",
				next = "j",
				help = "?",
			},
			multiline = true,
			indent_lines = true,
			win_config = { border = "single" },
			auto_open = false,
			auto_close = true,
			auto_preview = true,
			auto_fold = false,
			auto_jump = { "lsp_definitions" },
			include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
			use_diagnostic_signs = true,
		})

		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end, { desc = "Toggle trouble window" })

		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Toggle workspace diagnostics" })

		vim.keymap.set("n", "<leader>tb", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "Toggle buffer diagnostics" })

		vim.keymap.set("n", "<leader>tq", function()
			require("trouble").toggle("quickfix")
		end, { desc = "Toggle quickfix" })

		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").toggle("loclist")
		end, { desc = "Toggle loclist" })

		vim.keymap.set("n", "tR", function()
			require("trouble").toggle("lsp_references")
		end, { desc = "Toggle lsp references" })
	end,
	opts = {},
}
