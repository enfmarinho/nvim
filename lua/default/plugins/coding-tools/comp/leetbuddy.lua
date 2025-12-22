return {
	"Dhanus3133/Leetbuddy.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("leetbuddy").setup({
			domain = "com",
			language = "cpp",
			keys = {
				select = "<CR>",
				reset = "<C-r>",
				easy = "<C-e>",
				medium = "<C-d>",
				hard = "<C-h>",
				accepted = "<C-a>",
				not_started = "<C-y>",
				tried = "<C-t>",
			},
		})
	end,
	keys = {
		{ "<leader>lbl", "<cmd>LBQuestions<cr>", desc = "List Questions" },
		{ "<leader>lbv", "<cmd>LBQuestion<cr>", desc = "View Question" },
		{ "<leader>lbR", "<cmd>LBReset<cr>", desc = "Reset Code" },
		{ "<leader>lbr", "<cmd>LBTest<cr>", desc = "Run Code" },
		{ "<leader>lbs", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
	},
}
