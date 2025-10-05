return {
	"rmagatti/goto-preview",
	enabled = true,
	dependencies = { "rmagatti/logger.nvim" },
	event = "VeryLazy",
	config = function()
		require("goto-preview").setup({
			width = 120,
			height = 25,
			border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
			default_mappings = false,
			debug = false,
			opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
			resizing_mappings = true,
			post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
			post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
			references = {
				telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
			},
			focus_on_open = true,
			dismiss_on_move = false,
			force_close = true, --See :h nvim_win_close
			bufhidden = "wipe", -- See :h bufhidden
			stack_floating_preview_windows = true, -- Whether to nest floating windows
			preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
		})

		local keymap = vim.keymap
		keymap.set(
			"n",
			"<leader>pf",
			"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
			{ desc = "Preview definition" }
		)
		keymap.set(
			"n",
			"<leader>pt",
			"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
			{ desc = "Preview type definition" }
		)
		keymap.set(
			"n",
			"<leader>pi",
			"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
			{ desc = "Preview implementation" }
		)
		keymap.set(
			"n",
			"<leader>pd",
			"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
			{ desc = "Preview declaration" }
		)
		keymap.set(
			"n",
			"<leader>pc",
			"<cmd>lua require('goto-preview').close_all_win()<CR>",
			{ desc = "Close all windows" }
		)
		keymap.set(
			"n",
			"<leader>pr",
			"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
			{ desc = "Preview references" }
		)
	end,
}
