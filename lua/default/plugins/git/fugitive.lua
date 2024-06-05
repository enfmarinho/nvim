return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>GG", "<cmd> G <cr>", { desc = "Toggle fugitive window" })
		vim.keymap.set("n", "<leader>Gc", "<cmd> G commit --verbose <cr>", { desc = "Commit staged files" })
		vim.keymap.set("n", "<leader>Gp", "<cmd> G push <cr>", { desc = "Push commits" })
	end,
}
