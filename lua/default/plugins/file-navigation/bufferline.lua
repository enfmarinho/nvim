return {
	"akinsho/bufferline.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				groups = {
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = "" }),
					},
				},
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diagnostics_dict, _)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})
		vim.cmd("hi BufferLineFill guibg=none")

		local keymap = vim.keymap
		keymap.set("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close buffer" })
		keymap.set("n", "<leader>bt", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
		keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to previous buffer" })
		keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to next buffer" })
		keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move current buffer backyards" })
		keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move current buffer forwards" })
		keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to buffer 1" })
		keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to buffer 2" })
		keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to buffer 3" })
		keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to buffer 4" })
		keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to buffer 5" })
		keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to buffer 6" })
		keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to buffer 7" })
		keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to buffer 8" })
		keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to buffer 9" })
	end,
}
