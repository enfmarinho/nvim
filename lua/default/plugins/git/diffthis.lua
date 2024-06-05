return {
	enabled = true,
	event = "VeryLazy",
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>go", "<cmd>DiffviewOpen<cr>", { desc = "Open diff view" })
		keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close diff view" })
		-- keymap.set("n", "<cmd>")
	end,
}
