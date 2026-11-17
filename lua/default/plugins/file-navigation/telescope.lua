return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				preview = {
					-- Render images with snacks.image
					mime_hook = function(filepath, bufnr, opts)
						local ok, snacks_image = pcall(function()
							return Snacks.image
						end)
						if ok and snacks_image and snacks_image.supports_file(filepath) then
							vim.schedule(function()
								if vim.api.nvim_buf_is_valid(bufnr) then
									snacks_image.buf.attach(bufnr, { src = filepath })
								end
							end)
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						-- ["<C-s>"] = actions.cycle_previewers_next,
						-- ["<C-a>"] = actions.cycle_previewers_prev,
						-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						-- ["<C-v>"] = false, -- Disable vertical split buffer
						-- ["<C-x>"] = false, -- Disable horizontal split buffer
						["<tab>"] = false,
						["<S-tab>"] = false,
						["<C-p>"] = false,
						["<C-n>"] = false,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fu", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })
		keymap.set(
			"n",
			"<leader>fs",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Find word in current buffer " }
		)
	end,
}
