return {
	enabled = false,
	"akinsho/git-conflict.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("git-conflict").setup({
			default_mappings = {
				ours = "<leader>co",
				theirs = "<leader>ct",
				none = "<leader>cn",
				both = "<leader>cb",
				next = "<leader>cn",
				prev = "<leader>cp",
			},
		})
	end,
}
