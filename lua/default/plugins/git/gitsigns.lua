return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = {
				enable = false,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "<leader>gn", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { desc = "Go to next hunk", expr = true })

				map("n", "<leader>gp", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { desc = "Go to previous hunk", expr = true })

				map("n", "<leader>gA", gs.stage_buffer, { desc = "Add current buffer" })
				map("n", "<leader>ga", gs.stage_hunk, { desc = "Add current hunk" })
				map("v", "<leader>ga", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Add current hunk partially" })
				map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset current buffer" })
				map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset current hunk" })
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset current hunk partially" })
				map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo last hunk commit" })
				map("n", "<leader>gB", function()
					gs.blame_line({ full = true })
				end, { desc = "Toggle blane line window" })
				map("n", "<leader>gb", gs.blame_line, { desc = "Toggle blame line" })
				map("n", "<leader>gP", gs.preview_hunk_inline, { desc = "Preview hunk differences inline" })
				-- map('n', '<leader>gd', gs.toggle_deleted, { desc = "show deleted lines"})
				-- map('n', '<leader>gD', function() gs.diffthis('~') end)
				-- map('n', '<leader>gd', gs.diffthis, { desc = "Toggle diff window"})
				-- map('n', '<leader>tb', gs.toggle_current_line_blame) -- Toggle blame line.
			end,
		})
		vim.cmd("highlight SignColumn guibg=none")
		vim.cmd("highlight GitSignsAdd guifg=#238e14")
		vim.cmd("highlight GitSignsChange guifg=#7f148e")
		vim.cmd("highlight GitSignsDelete guifg=#E34b28")
		-- This should be in options. Highlight the relative number.
		vim.cmd("set cursorline")
		vim.cmd("set cursorlineopt=number")
		vim.cmd("highlight! CursorLineNr guibg=NONE guifg=#ffffff")
	end,
}
