return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	event = "VeryLazy",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	enabled = true,
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.keymap.set("n", "<leader>pm", "<cmd> MarkdownPreview <cr>", { desc = "Preview markdown" })
	end,
}
