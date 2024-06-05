return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	opts = {
		padding = true, -- Add a space between comment and the line.
		sticky = true, -- Whether the cursor should stay at its position.
		ignore = nil, -- Lines to be ignored while (un)comment.
		toggler = {
			line = "<leader>//", -- Line comment toggle keymap.
			block = "<leader>/*", -- Block comment toggle keymap.
		},
		---LHS of extra mappings
		extra = {
			above = "<leader>/O", -- Add comment on the line above.
			below = "<leader>/o", -- Add comment on the line below.
			eol = "<leader>/A", -- Add comment at the end of line.
		},
		---Enable keybindings
		mappings = {
			basic = true,
			extra = true,
		},
		pre_hook = nil, -- Function to call before (un)comment
		post_hook = nil, -- Function to call after (un)comment.
	},
}
