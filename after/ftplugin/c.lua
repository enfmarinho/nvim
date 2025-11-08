vim.keymap.set(
	"n",
	"<leader>lc",
	"<cmd>LspClangdSwitchSourceHeader<cr>",
	{ desc = "Change between header and source file" }
)
vim.keymap.set(
	"n",
	"<leader>li",
	"<cmd>LspClangdShowSymbolInfo<cr>",
	{ desc = "Change between header and source file" }
)
