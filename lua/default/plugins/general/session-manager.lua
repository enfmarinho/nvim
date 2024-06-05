return {
	"Shatur/neovim-session-manager",
	enabled = false,
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local Path = require("plenary.path")
		local config = require("session_manager.config")
		require("session_manager").setup({
			sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
			autoload_mode = config.AutoloadMode.CurrentDir,
			autosave_last_session = false,
			autosave_ignore_not_normal = true,
			autosave_ignore_dirs = {},
			autosave_ignore_filetypes = {
				"gitcommit",
				"gitrebase",
			},
			autosave_ignore_buftypes = {
				"/",
				"~/",
				"~/Downloads",
				"~/Code",
			},
			autosave_only_in_session = false,
			max_path_length = 0,
		})

		vim.keymap.set(
			"n",
			"<leader>sl",
			"<cmd>SessionManager load_session<cr>",
			{ desc = "Open list of saved session" }
		)
		vim.keymap.set(
			"n",
			"<leader>so",
			"<cmd>SessionManager load_current_dir_session<cr>",
			{ desc = "Open last saved session" }
		)
		vim.keymap.set(
			"n",
			"<leader>ss",
			"<cmd>SessionManager save_current_session<cr>",
			{ desc = "Save current session" }
		)
		vim.keymap.set("n", "<leader>sd", "<cmd>SessionManager delete_session<cr>", { desc = "Delete session" })
	end,
}
