return {
	"itchyny/calendar.vim",
	event = "VeryLazy",
	enabled = true,
	config = function()
		vim.keymap.set("n", "<leader>CC", "<cmd> Calendar -date_full_month_name <cr>", { desc = "Open calendar" })
		vim.keymap.set("n", "<leader>CW", "<cmd> Calendar -view=week <cr>", { desc = "Open weekly calendar" })
		vim.keymap.set("n", "<leader>CD", "<cmd> Calendar -day <cr>", { desc = "Open daily calendar" })
	end,
}
