return {
	"mbbill/undotree",
	event = "VeryLazy",
	enabled = true,
	config = function()
		vim.keymap.set("n", "<leader>uu", "<cmd> UndotreeToggle <cr>", { desc = "Toggle undotree" })
		local opts = {
			-- undotree_WindowLayout = 2
			-- undotree_SplitWidth = 30,
			-- undotree_DiffpanelHeight = 10,
			-- undotree_ShortIndicators = 0,
			undotree_HighlightChangedText = 0,
			undotree_HelpLine = 0,
			undotree_CursorLine = 1,
		}
		for option, value in pairs(opts) do
			vim.g[option] = value
		end
	end,
}
