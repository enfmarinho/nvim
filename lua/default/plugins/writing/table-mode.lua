return {
	"dhruvasagar/vim-table-mode",
	event = "VeryLazy",
	enabled = true,
	init = function()
		vim.g["table_mode_map_prefix"] = "<leader>a"
	end,
}
