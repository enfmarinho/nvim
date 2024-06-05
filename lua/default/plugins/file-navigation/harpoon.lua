return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		global_settings = {
			save_on_toggle = true,
			save_on_change = true,
			enter_on_sendcmd = false,
			tmux_autoclose_windows = false,
			excluded_filetypes = { "harpoon", "NvimTree_1" },
			mark_branch = false,
			tabline = true,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
		},
	},
	config = function()
		require("telescope").load_extension("harpoon")

		vim.keymap.set(
			"n",
			"<leader>hm",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		vim.keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>", { desc = "Open harpoon on telescode" })
		vim.keymap.set(
			"n",
			"<leader>hh",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Toggle quick menu" }
		)
		vim.keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		vim.keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
		vim.keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Go to file 1" })
		vim.keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Go to file 2" })
		vim.keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Go to file 3" })
		vim.keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Go to file 4" })
		vim.keymap.set("n", "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Go to file 5" })
		vim.keymap.set("n", "<leader>h6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Go to file 6" })
		vim.keymap.set("n", "<leader>h7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", { desc = "Go to file 7" })
		vim.keymap.set("n", "<leader>h8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", { desc = "Go to file 8" })
		vim.keymap.set("n", "<leader>h9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", { desc = "Go to file 9" })
	end,
}
